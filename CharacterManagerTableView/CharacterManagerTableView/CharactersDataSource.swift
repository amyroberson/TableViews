//
//  CharactersDataSource.swift
//  CharacterManagerTableView
//
//  Created by Amy Roberson on 1/14/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class CharactersDataSource: NSObject, UITableViewDataSource{
    
    let characters: [PlayerCharacter] = [PlayerCharacter(name: "Hermione Granger", experience: 20, classification: .
                                             student, isEvil: false, boggart: "failure", patronus: "Otter", wandWood: "VineWood"),
                                         PlayerCharacter(name: "Minerva McGonagall", experience: 50, classification: .orderOfThePhoenix, isEvil: false, boggart: "Lord Voldemort", patronus: "Cat", wandWood: "Fir"),
                                         PlayerCharacter(name: "Lucius Malfoy", experience: 30, classification: .deathEater, isEvil: true, boggart: "Lord Voldemort", patronus: "none", wandWood: "Elm"),
                                         PlayerCharacter(name: "Ron Weasley", experience: 18, classification: .student, isEvil: false, boggart: "Aragog", patronus: "Jack Russell Terrier", wandWood: "Chestnut"),
                                         PlayerCharacter(name: "Ginevra Weasley", experience: 17, classification: .student, isEvil: false, boggart: "unknown", patronus: "Horse", wandWood: "Yew")]
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell") as! CharacterCell
        
        let character = characters[indexPath.row]
        cell.nameLabel.text = character.name
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
}
