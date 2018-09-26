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
        let dateFormat = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        let dateNew = dateFormatter.date(from: dateToConvert)
        
        guard dateNew != nil else {
            fatalError("Incorrect Date Format")
        }
        self.dateConverted = dateNew!
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
