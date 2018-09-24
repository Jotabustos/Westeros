//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Jose Julián Bustos Díaz on 10/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTests: XCTestCase {
    
    var starkHouse: House! // House!
    var starkSigil: Sigil!
    var ned: Person!
    var arya: Person!
    
    // Este código se ejecuta antes de cada una de las funciones. De esta forma se vuelve siempre al mismo estado inicial. Cada test debe ser independiente del anterior
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkURL)
        ned = Person(name: "Eddan", alias: "Ned", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterExistence(){
        XCTAssertNotNil(ned)
        XCTAssertNotNil(arya)
    }
    
    func testPersonFullName(){
        XCTAssertEqual(ned.fullName, "Eddan Stark")
    }
    
    func testPersonEquatable(){
        
        // 1. Identidad
        XCTAssertEqual(ned, ned)
        // 2. Igualdad
        let eddan = Person(name: "Eddan", alias: "Ned", house: starkHouse)
        XCTAssertEqual(ned, eddan)
        // 3. Desigualdad
        XCTAssertNotEqual(ned, arya)
    }
    
    func testPersonComparaison(){
        XCTAssertLessThan(arya, ned)
    }

}
