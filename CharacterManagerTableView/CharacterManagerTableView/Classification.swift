//
//  Classification.swift
//  CharacterManager
//
//  Created by Amy Roberson on 1/3/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

public enum Classification : String, CustomStringConvertible{
    case student = "Student"
    case orderOfThePhoenix = "Order of the Phoenix"
    case deathEater = "Death Eater"
    
    public var description: String {
        switch self {
        case .deathEater:
            return "Death Eater"
        case .orderOfThePhoenix:
            return "Order of the Phoenix"
        case .student:
            return "Student"
        }
    }
    
    
}
