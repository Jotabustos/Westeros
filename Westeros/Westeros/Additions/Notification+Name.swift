//
//  Notification+Name.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 24/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let houseDidChangeNotification = Notification.Name(Constants.houseDidChangeNotificationName)
    static let seasonDidChangeNotification = Notification.Name(Constants.seasonDidChangeNotificationName)
    static let episodeDidChangeNotification = Notification.Name(Constants.episodeDidChangeNotificationName)
    static let personDidChangeNotification = Notification.Name(Constants.personDidChangeNotificationName)
}
