//
//  ReleaseTest.swift
//  WesterosTests
//
//  Created by Jose Julián Bustos Díaz on 25/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import XCTest

@testable import Westeros

class ReleaseTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReleaseDateExistence(){
        let date = ReleaseTime(dateToConvert: "1994-06-06")
        XCTAssertNotNil(date)
    }
    
    func testReleaseDateComparaison(){
        let date = ReleaseTime(dateToConvert: "1994-06-06")
        let now = ReleaseTime(dateToConvert: "1994-06-08")
        XCTAssertLessThan(date, now)
    }
}
