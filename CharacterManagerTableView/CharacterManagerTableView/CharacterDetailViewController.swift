//
//  CharacterDetailViewController.swift
//  CharacterManagerTableView
//
//  Created by Amy Roberson on 1/14/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    
    var currentCharacter : PlayerCharacter?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var currentHealthLabel: UILabel!
    @IBOutlet weak var maxHealthLabel: UILabel!
    @IBOutlet weak var currentMagicLabel: UILabel!
    @IBOutlet weak var maxMagicLabel: UILabel!
    @IBOutlet weak var magicalAttributes: UILabel!
    @IBOutlet weak var wandWoodLabel: UILabel!
    @IBOutlet weak var patronusLabel: UILabel!
    @IBOutlet weak var boggartLabel: UILabel!
    @IBOutlet weak var isFightingLabel: UILabel!
    @IBOutlet weak var isEvilLabel: UILabel!
    @IBOutlet weak var isAliveLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        refresh()
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func refresh(){
        nameLabel.text = currentCharacter?.name
        classificationLabel.text = currentCharacter?.classification.description
        currentHealthLabel.text = "Current Health: \((currentCharacter?.currentHealth)!)"
        maxHealthLabel.text = "Max Health: \((currentCharacter?.maxHealth)!)"
        currentMagicLabel.text = "Current Health: \((currentCharacter?.currentHealth)!)"
        maxMagicLabel.text = "Max Magic: \((currentCharacter?.maxMagic)!)"
        wandWoodLabel.text = "Wand Wood: \((currentCharacter?.wandWood)!)"
        patronusLabel.text = "Patronus: \((currentCharacter?.patronus)!)"
        boggartLabel.text = "Boggart: \((currentCharacter?.boggart)!)"
        if let fighting = currentCharacter?.isFighting {
            if fighting{
                isFightingLabel.text = "Still Fighting!"
            } else {
                isFightingLabel.text = "No Longer Fighting"
            }
        }
        if let alive = currentCharacter?.isAlive, let fighting = currentCharacter?.isFighting{
            if alive && fighting {
                isAliveLabel.text = "Still Alive!"
            } else if alive {
                isAliveLabel.text = "Still Alive, but needs rest!"
            } else {
                isAliveLabel.text = "Has passed"
            }
        }
        if let evil = currentCharacter?.isEvil {
            if evil {
                isEvilLabel.text = "Evil!"
            } else if !evil && currentCharacter?.classification == .deathEater{
                isEvilLabel.text = "Not all who act evil are..."
            } else {
            isEvilLabel.text = "Fighting for Good!"
            }
        
        }
    }
}
