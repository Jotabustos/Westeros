//
//  SeasonTest.swift
//  WesterosTests
//
//  Created by Jose Julián Bustos Díaz on 25/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import XCTest

@testable import Westeros

class SeasonTest: XCTestCase {
    
    var season: Season!
    var season2: Season!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        season = Season(name: "First Season", release: ReleaseTime(dateToConvert: "1994-06-06"))
        season2 = Season(name: "Second Season", release: ReleaseTime(dateToConvert: "1995-06-06"))
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSeasonExistence() {
        XCTAssertNotNil(season)
    }
    
    func testSeasonEquatable() {
        XCTAssertEqual(season, season)
        XCTAssertNotEqual(season, season2)
    }
    
    func testSeasonComparable() {
        XCTAssertLessThan(season, season2)
    }
    
    func testSeasonCustomStringConvertible(){
        XCTAssertNotNil(season.description)
        XCTAssertEqual(season.description, "Season: \(season.name). Released in: \(season.release)")
    }
    
    func testSeasonHashable() {
        XCTAssertNotNil(season.hashValue)
    }

}
