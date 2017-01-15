//
//  ViewController.swift
//  CharacterManagerTableView
//
//  Created by Amy Roberson on 1/14/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController, UITableViewDelegate {

    
    
    var tableView: UITableView{
        return view as! UITableView
    }
    
    var dataSource = CharactersDataSource()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //set characterDetailView Controller and switchView
        let currentCharacter = dataSource.characters[indexPath.row]
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let characterDetail = storyBoard.instantiateViewController(withIdentifier: "CharacterDetail") as! CharacterDetailViewController
        characterDetail.currentCharacter = currentCharacter
        
        self.present(characterDetail, animated: true, completion: nil)
    }
    
}

