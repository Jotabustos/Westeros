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
        // REFACTORIZAMOS. ESTABA BIEN EH
//        if person.house.name == self.name {
//        _members.insert(person)
//        }
        guard self.name == person.house.name else{
            return
        }
        _members.insert(person)
    }
}

extension House {
    var proxyForEquality: String {
        return "\(name)\(sigil)\(words)\(count)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}



extension House: Equatable {
    
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}

extension House: Hashable{
    var hashValue: Int {
        return proxyForEquality.hashValue 
    }
}



extension House: Comparable {
    static func < (lhs: House, rhs: House) -> Bool{
        // Orden alfabetico
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
