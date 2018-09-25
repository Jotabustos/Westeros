//
//  EpisodeTest.swift
//  WesterosTests
//
//  Created by Jose Julián Bustos Díaz on 25/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import XCTest

@testable import Westeros

class EpisodeTest: XCTestCase {
    
    var episode: Episode!
    var episode2: Episode!
    var season: Season!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        season = Season(name: "First Season", release: ReleaseTime(dateToConvert: "21-06-1994"), episodes: "episodes")
        episode = Episode(name: "Cap. 1", release: ReleaseTime(dateToConvert: "21-06-1994"), season: season)
        episode2 = Episode(name: "Cap. 2", release: ReleaseTime(dateToConvert: "28-06-1994"), season: season)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEpisodeExistence(){
        XCTAssertNotNil(episode)
    }
    
    func testEpisodeEquatable() {
        XCTAssertEqual(episode, episode)
        XCTAssertNotEqual(episode, episode2)
    }
    
    func testEpisodeComparaison() {
        XCTAssertLessThan(episode, episode2)
    }
    
    func testEpisodeCustomStringConvertible(){
        XCTAssertNotNil(episode.description)
        XCTAssertEqual(episode.description, "Episode: \(episode.name). Released in: \(episode.release)")
    }
    
    func testEpisodeHashable() {
        XCTAssertNotNil(episode.hashValue)
    }

}
