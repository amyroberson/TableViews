//
//  ClassificationTests.swift
//  CharacterManager
//
//  Created by Amy Roberson on 1/3/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
import CharacterManager

class ClassificationTests: XCTestCase {
    
    func testDescription() {
        let type: Classification = .orderOfThePhoenix
        XCTAssertEqual(type.description, "Order of the Phoenix")
        let type2: Classification = .student
        XCTAssertEqual(type2.description, "Student")
        let type3: Classification = .deathEater
        XCTAssertEqual(type3.description, "Death Eater")
    }
    
}
