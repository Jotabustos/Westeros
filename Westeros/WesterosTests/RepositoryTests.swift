//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Jose Julián Bustos Díaz on 12/9/18.
//  Copyright © 2018 Jose Julián Bustos Díaz. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {

    var localHouses: [House]!
    var localSeasons: [Season]!
    
    override func setUp() {
       localHouses = Repository.local.houses
       localSeasons = Repository.local.seasons
    }

    func testLocalRepositoryExistence() {
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses(){
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInsensitive(){
        let stark = Repository.local.house(named: "sTark")
        XCTAssertEqual(stark?.name, "Stark")
        let keepcoding = Repository.local.house(named: "KeepCoding")
        XCTAssertNil(keepcoding)
    }
    
    func testLocalRepositoryHouseFiltering(){
        var filtered = Repository.local.houses { $0.count == 1 }
        XCTAssertEqual(filtered.count, 1)
        
        filtered = Repository.local.houses {$0.count == 100} // Devuelve un array vacio, no nil
        XCTAssertTrue(filtered.isEmpty)
    }
    
    // Seasons
    
    func testLocalRepositorySeasonExistence() {
        XCTAssertNotNil(localSeasons)
        XCTAssertEqual(localSeasons.count, 7)
    }
    
    func testLocalRepositorySeasonFiltering(){
        var filtered = Repository.local.seasons { $0.count == 10 }
        XCTAssertEqual(filtered.count, 6) // There are 6 seasons with 10 episodes
        
        filtered = Repository.local.seasons {$0.count == 100} // Devuelve un array vacio, no nil
        XCTAssertTrue(filtered.isEmpty)
    }
    
    func testLocalRepositoryHouseNamedFromEnum(){
        let houseNamedStark = Repository.local.house(named: .Lannister)
        XCTAssertNotNil(houseNamedStark)
    }
        
}
