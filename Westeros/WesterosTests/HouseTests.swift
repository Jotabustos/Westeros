//
//  HouseTests.swift
//  WesterosTests
//
//  Created by Jose Julián Bustos Díaz on 10/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import XCTest

@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkSigil: Sigil!
    var lannisterSigil: Sigil!
    
    var starkHouse: House!
    var lannisterHouse: House!
    
    var robb: Person!
    var arya: Person!
    var tyrion: Person!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        lannisterSigil = Sigil(image: UIImage(), description: "Leon Rampeante")
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkURL)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterkURL)
        
        robb = Person(name: "Robb", alias: "El joven Lobo", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHouseExistence() {
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence(){

        XCTAssertNotNil(starkSigil)
    }
    
    
    func testHouse_AddPerson_ReturnsTheCorrectCountOfPersons() {
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        XCTAssertEqual(lannisterHouse.count, 0)
        
        lannisterHouse.add(person: tyrion)
        XCTAssertEqual(lannisterHouse.count, 1)
        lannisterHouse.add(person: arya)
        XCTAssertEqual(lannisterHouse.count, 1)
        
        // Meter validacion de la misma casa
        
    }
    
    func testHouse_AddPersonAtATime_ReturnsTheCorrectCountOfPersons() {
        XCTAssertEqual(starkHouse.count, 0)
        starkHouse.add(persons: arya, tyrion,robb )
        
    }
    
    func testHouseEquality() {
        // 1. Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        // 2. Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(jinxed, starkHouse)
        // 3. Desigualdad
        XCTAssertNotEqual(lannisterHouse, starkHouse)
    }
    
    func testHouseHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparaison() {
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
}
