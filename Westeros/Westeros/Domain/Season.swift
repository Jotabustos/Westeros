//
//  Season.swift
//  Westeros
//
//  Created by Jose Julián Bustos Díaz on 25/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import Foundation

typealias EpisodesOfSeason = Set<Episode>

final class Season {
    
    // MARK: - Properties
    
    let name: String
    let release: ReleaseTime
    private var _episodes: EpisodesOfSeason
    
    var sortedEpisodes: [Episode] {
        return _episodes.sorted()
    }
    
    init(name: String, release: ReleaseTime) {
        self.name = name
        self.release = release
        self._episodes = EpisodesOfSeason()
    }
    
}

extension Season {
    var count: Int {
        return _episodes.count
    }
    
    func add(episode: Episode){
        _episodes.insert(episode)
    }
}


// MARK: - Protocols

extension Season {
    var proxyForEquality: String {
        return "\(name) \(release)"
    }
    
    var proxyForComparison: ReleaseTime {
        return release
    }
}

extension Season: Equatable {
    static func == (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

extension Season: Comparable {
    static func < (lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension Season: CustomStringConvertible {
    var description: String {
        return "Season: \(name). Released in: \(release)"
    }
}
