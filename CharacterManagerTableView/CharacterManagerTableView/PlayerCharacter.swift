//
//  PlayerCharacter.swift
//  CharacterManager
//
//  Created by Amy Roberson on 1/3/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

public class PlayerCharacter {
    public let name: String
    public fileprivate(set) var currentHealth: Int {
        didSet {
                if currentHealth < 0 {
                    currentHealth = 0
                } else if currentHealth > maxHealth {
                    currentHealth = maxHealth
            }
        }
    }
    public fileprivate(set) var currentMagic: Int {
        didSet{
            if currentMagic < 0 {
                currentMagic = 0
            } else if currentMagic > maxMagic {
                currentMagic = maxMagic
            }
        }
    }
    public fileprivate(set) var classification: Classification
    public fileprivate(set) var experience: Int
    public fileprivate(set) var isEvil: Bool
    public fileprivate(set) var boggart: String
    public fileprivate(set) var patronus: String
    public fileprivate(set) var wandWood: String
    
    public var level: Int {
        return (experience / 4) + 1
    }
    public var maxMagic: Int {
        switch self.classification {
        case .student:
            return 100 + (self.level * 2)
        case .orderOfThePhoenix:
            return 120 + (self.level * 3)
        case .deathEater:
            return 120 + (self.level * 2)
        }
    }
    public var maxHealth: Int {
        switch self.classification {
        case .student:
            return 100 + (self.level * 2)
        case .orderOfThePhoenix:
            return 120 + (self.level * 3)
        case .deathEater:
            return 105 + (self.level * 2)
        }
    }
    public var isFighting: Bool {
        if currentHealth == 0 || currentMagic == 0{
            return false
        } else {
            return true
        }
    }
    public var isAlive: Bool {
        if currentHealth == 0 {
            return false
        } else {
            return true
        }
        
    }
    
    public init(name: String, experience: Int, classification: Classification, isEvil: Bool, boggart: String, patronus: String, wandWood: String){
        self.name = name
        self.experience = experience
        self.classification = classification
        self.isEvil = isEvil
        self.boggart = boggart
        self.patronus = patronus
        self.wandWood = wandWood
        self.currentMagic = 100
        self.currentHealth = 100
    }
    
     init?(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String ?? ""
        self.currentHealth = dictionary["currentHealth"] as? Int ?? 0
        self.currentMagic = dictionary["currentMagic"] as? Int ?? 0
        guard let classificationText = dictionary["classification"] as? String else { return nil }
        guard let classification = Classification(rawValue: classificationText) else { return nil }
        self.classification = classification
        self.experience = dictionary["experience"] as? Int ?? 0
        self.isEvil = dictionary["isEvil"] as? Bool ?? false
        self.boggart = dictionary["boggart"] as? String ?? ""
        self.patronus = dictionary["patronus"] as? String ?? ""
        self.wandWood = dictionary["wandWood"] as? String ?? ""
    }
    
    
    public func takeDamage(_ n: Int){
       self.currentHealth -= n
    }
    
    public func heal(_ n: Int){
        self.currentHealth += n
    }
    
    
    func toDictionary() -> [String: Any]{
        let dictionary: [String: Any] = [
            "name" : self.name,
            "currentHealth" : self.currentHealth,
            "currentMagic" : self.currentMagic,
            "classification" : self.classification.description,
            "experience" : self.experience,
            "isEvil" : self.isEvil,
            "boggart" : self.boggart,
            "patronus" : self.patronus,
            "wandWood" : self.wandWood,
            "level" : self.level,
            "maxMagic" : self.maxMagic,
            "maxHealth" : self.maxHealth,
            "isFighting" : self.isFighting,
            "isAlive": self.isAlive,
        ]
        
        return dictionary
    }
    
    func toJson() throws -> Data {
        let jsonRepresentation = try JSONSerialization.data(withJSONObject: self.toDictionary(), options: [])
        return jsonRepresentation
    }
}
