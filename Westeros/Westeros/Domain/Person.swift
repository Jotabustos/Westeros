//
//  Character.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 10/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import Foundation

final class Person {
    
    // MARK: - Properties
    let name: String
    let house: House
    private let _alias: String?
    
    var alias: String{
        get{
//            if let alias = _alias {
//                // Existe y esta guardado dentro de alias
//                return alias
//            } else {
//                return ""
//            }
            
            return _alias ?? "" // Devuelveme _alias, si hay algo, y si no ""
        }
    }
    
    // MARK: - Initialization
    init(name:String, alias: String? = nil, house: House){ // Inicializadores por defecto
        self.name = name
        _alias = alias
        self.house = house
    }
    
//    convenience init(name:String, house: House){
//        self.init(name: name, alias: nil ,house: house)
//    }

}

// MARK: - Extensions

extension Person {
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

extension Person {
    var proxy: String {
        return "\(name)\(alias)\(house.name)"
    }
}

extension Person: Hashable {
    var hashValue: Int {
        return proxy.hashValue
    }
}

extension Person: Equatable {
    static func ==(lhs: Person, rhs: Person) -> Bool {
        
        return lhs.proxy == rhs.proxy
        
    }
}
