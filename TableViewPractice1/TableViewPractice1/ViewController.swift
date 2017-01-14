//
//  ViewController.swift
//  TableViewPractice1
//
//  Created by Amy Roberson on 1/13/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    let dataSource = BeverageDataSource()
    var tableView: UITableView {
        return view as! UITableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = dataSource
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class BeverageDataSource: NSObject, UITableViewDataSource {
   
    
    
    var beverages: [Beverage] = [Beverage(name: "CocaCola", catigory: "SoftDrink"),
                                 Beverage(name: "Dr.Pepper", catigory: "SoftDrink"),
                                 Beverage(name: "Oban", catigory: "Liquor"),
                                 Beverage(name: "Woodruff Reserve", catigory: "Liquor"),
                                 Beverage(name: "Amarretto Sour", catigory: "Mixed Drink") ]
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beverages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeverageCell", for: indexPath)
        let currentBeverage: Beverage? = beverages[indexPath.row]
        
        cell.textLabel?.text = currentBeverage?.name
        cell.detailTextLabel?.text = currentBeverage?.catigory
        
        return cell
    }
}

