//
//  Date+Personalized.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 25/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import Foundation

extension String {
    func personalizedDateFormatterFromString(date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let day = formatter.date(from: date)
        return day! // Check if it is not nil
    }
}
