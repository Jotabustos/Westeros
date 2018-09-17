//
//  Repository.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 12/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import UIKit

final class Repository {
    static let local = LocalFactory()
}


protocol HouseFactory {
    typealias Filter = (House) -> Bool
    var houses: [House] {
        get
    }
    
    func house(named name: String) -> House?
    
    func houses(filteredBy: Filter ) -> [House]
}

final class LocalFactory: HouseFactory {
    
    var houses: [House] {
        
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        let lannisterSigil = Sigil(image: UIImage(named: "lannister.jpg")!, description: "León Rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragón Tricéfalo")
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: starkURL)
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: lannisterkURL)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: targaryenURL)
        
        // Characters creation
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El matarreyes", house: lannisterHouse)
        let dani = Person(name: "Daenerys", alias: "Madre de dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(persons: arya,robb)
        lannisterHouse.add(persons: tyrion,cersei,jaime)
        targaryenHouse.add(person: dani)
        
        
        return [starkHouse, lannisterHouse,targaryenHouse].sorted()
    }
    
    func house(named name: String) -> House? {
        return self.houses.filter{ $0.name.uppercased() == name.uppercased() }.first
    }
    
    func houses(filteredBy: Filter) -> [House] {
        return self.houses.filter(filteredBy)
            
        }
}
