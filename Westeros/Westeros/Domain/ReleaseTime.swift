//
//  ReleaseTime.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 25/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import Foundation

final class ReleaseTime{
    
    let dateConverted: Date
    
    init(dateToConvert:String){
        let dateFormat = "dd-MM-yyyy"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let date = dateFormatter.date(from: dateToConvert)
        
        guard date != nil else {
            fatalError("Incorrect Date Format")
        }
        self.dateConverted = date!
    }
}


extension ReleaseTime {
    var proxyForEquality: String {
        return "\(dateConverted)"
    }
    
    var proxyForComparison: Date {
        return dateConverted
    }
}


extension ReleaseTime: Equatable {
    
    static func == (lhs: ReleaseTime, rhs: ReleaseTime) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
}

extension ReleaseTime: Comparable {
    static func < (lhs: ReleaseTime, rhs: ReleaseTime) -> Bool{
        // Orden alfabetico
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
