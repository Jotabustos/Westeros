//
//  House.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 10/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import Foundation

typealias Words = String
typealias Members = Set<Person>

final class House {
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members
    
    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
        self._members = Members()
    }
}

// MARK: - Extensions

extension House {
    var count: Int {
        return _members.count
    }
    
    func add(person: Person){ // Cuando vamos a añadir a la persona, comprobamos que el nombre de su casa coincide con el de la casa a la que se le añade
        if person.house.name == self.name {
        _members.insert(person)
        }
    }
}
