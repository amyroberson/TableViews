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
    var indexToEdit: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
}

