//
//  Episode.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 25/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import Foundation

final class Episode {
    
    // MARK: - Properties
    let name: String
    let release: ReleaseTime
    weak var season: Season?
    
    init(name: String, release: ReleaseTime, season: Season?){
        self.name = name
        self.release = release
        self.season = season
    }
    
}

extension Episode {
    var proxyForEquality: String {
        return "\(name) \(release)"
    }
    
    var proxyForComparison: ReleaseTime {
        return release
    }
}

extension Episode: Equatable {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Episode: Comparable {
    static func < (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

extension Episode: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Episode: CustomStringConvertible {
    var description: String {
        return "Episode: \(name). Released in: \(release)"
    }
}
