//
//  PlayerCharacterTests.swift
//  CharacterManager
//
//  Created by Amy Roberson on 1/3/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import CharacterManager


class PlayerCharacterTests: XCTestCase {
    
    func testInit(){
        let hermione = PlayerCharacter(name: "Hermione Granger", experience: 20, classification: .student, isEvil: false, boggart: "Failure", patronus: "Otter", wandWood: "VineWood")
        XCTAssertEqual(hermione.level, 6)
        XCTAssertEqual(hermione.maxMagic, 112)
        XCTAssertEqual(hermione.maxHealth, 112)
    }
    
    func testINIT1(){
        let hermione = PlayerCharacter(name: "Hermione Granger", experience: 0, classification: .student, isEvil: false, boggart: "Failure", patronus: "Otter", wandWood: "VineWood")
        XCTAssertEqual(hermione.level, 1)
        XCTAssertEqual(hermione.maxMagic, 102)
        XCTAssertEqual(hermione.maxHealth, 102)
    }
    
    func testINIT2(){
        let notHermione = PlayerCharacter(name: "Hermione Granger", experience: 0, classification: .deathEater, isEvil: true, boggart: "Failure", patronus: "none", wandWood: "VineWood")
        XCTAssertEqual(notHermione.level, 1)
        XCTAssertEqual(notHermione.maxMagic, 122)
        XCTAssertEqual(notHermione.maxHealth, 107)
    }
    
    func testINIT3(){
    let minerva = PlayerCharacter(name: "Minerva McGonagall", experience: 50, classification: .orderOfThePhoenix, isEvil: false, boggart: "Voldemort", patronus: "Cat", wandWood: "Fir")
    XCTAssertEqual(minerva.level, 13)
    XCTAssertEqual(minerva.maxMagic, 159)
    XCTAssertEqual(minerva.maxHealth, 159)
    }
    
    func test(){
        let minerva = PlayerCharacter(name: "Minerva McGonagall", experience: 50, classification: .orderOfThePhoenix, isEvil: false, boggart: "Voldemort", patronus: "Cat", wandWood: "Fir")
        minerva.takeDamage(260)
        XCTAssertEqual(minerva.currentHealth, 0)
        XCTAssertEqual(minerva.level, 13)
        XCTAssertEqual(minerva.maxMagic, 159)
        XCTAssertEqual(minerva.maxHealth, 159)
    }
    
    func testDamageHeal(){
        let hermione = PlayerCharacter(name: "Hermione Granger", experience: 20, classification: .student, isEvil: false, boggart: "Failure", patronus: "Otter", wandWood: "VineWood")
        hermione.takeDamage(10)
        XCTAssertEqual(hermione.currentHealth, 90)
        hermione.heal(40)
        XCTAssertEqual(hermione.currentHealth, 112)
    }
    
    
    func testDamageHeal1(){
        let hermione = PlayerCharacter(name: "Hermione Granger", experience: 20, classification: .student, isEvil: false, boggart: "Failure", patronus: "Otter", wandWood: "VineWood")
        hermione.takeDamage(210)
        XCTAssertEqual(hermione.currentHealth, 0)
        hermione.heal(hermione.maxHealth)
        XCTAssertEqual(hermione.currentHealth, 112)
    }
    
    func testFailableINIT(){
        let dictionary: [String: Any] = [
            "name" : "Hermione Granger",
            "currentHealth" : 100,
            "currentMagic" : 100,
            "classification" : "Student",
            "experience" : 20,
            "isEvil" : false,
            "boggart" : "failure",
            "patronus" : "Otter",
            "wandWood" : "Vine Wood",
            "level" : 6,
            "maxMagic" : 1,
            "maxHealth" : 1,
            "isFighting" : true,
            "isAlive": true,
            ]
        let hermione = PlayerCharacter(dictionary:dictionary)
        let name = hermione?.name
        let currentHealth = hermione?.currentHealth
        let currentMagic = hermione?.currentMagic
        let classification = hermione?.classification
        let experience = hermione?.experience
        let isEvil = hermione?.isEvil
        let patronus = hermione?.patronus
        let boggart = hermione?.boggart
        let wandWood = hermione?.wandWood
        let level = hermione?.level
        XCTAssertEqual(name, "Hermione Granger")
        XCTAssertEqual(currentHealth, 100)
        XCTAssertEqual(currentMagic, 100)
        XCTAssertEqual(classification?.rawValue, "Student")
        XCTAssertEqual(experience, 20)
        XCTAssertEqual(boggart, "failure")
        XCTAssertEqual(wandWood, "Vine Wood")
        XCTAssertEqual(isEvil, false)
        XCTAssertEqual(level, 6)
        XCTAssertEqual(patronus, "Otter")
    }
    
    func testFailableINIT2(){
        let dictionary: [String: Any] = [
            "name" : "Belatrix Lastrange",
            "currentHealth" : 0,
            "currentMagic" : 0,
            "classification" : "Death Eater",
            "experience" : 50,
            "isEvil" : true,
            "boggart" : "failure",
            "patronus" : "none",
            "wandWood" : "Vine Wood",
            "level" : 13,
            "maxMagic" : 1,
            "maxHealth" : 1,
            "isFighting" : true,
            "isAlive": true,
            ]
        let belatrix = PlayerCharacter(dictionary:dictionary)
        let name = belatrix?.name
        let currentHealth = belatrix?.currentHealth
        let currentMagic = belatrix?.currentMagic
        let classification = belatrix?.classification
        let experience = belatrix?.experience
        let isEvil = belatrix?.isEvil
        let patronus = belatrix?.patronus
        let boggart = belatrix?.boggart
        let wandWood = belatrix?.wandWood
        let level = belatrix?.level
        XCTAssertEqual(name, "Belatrix Lastrange")
        XCTAssertEqual(currentHealth, 0)
        XCTAssertEqual(currentMagic, 0)
        XCTAssertEqual(classification?.rawValue, "Death Eater")
        XCTAssertEqual(experience, 50)
        XCTAssertEqual(boggart, "failure")
        XCTAssertEqual(wandWood, "Vine Wood")
        XCTAssertEqual(isEvil, true)
        XCTAssertEqual(level, 13)
        XCTAssertEqual(patronus, "none")
    }
}
