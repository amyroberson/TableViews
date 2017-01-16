//
//  ViewController.swift
//  CarTableView
//
//  Created by Amy Roberson on 1/14/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController, UITableViewDelegate {

    let dataSource = CarsDataSource()
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

