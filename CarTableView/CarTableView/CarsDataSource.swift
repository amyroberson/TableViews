//
//  CarsDataSource.swift
//  CarTableView
//
//  Created by Amy Roberson on 1/15/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

class CarsDataSource: NSObject, UITableViewDataSource{
    
    let section: [String] = ["Cars I want:", "Cars I Have:"]
    var cars: [[Car]] = [[Car(make: "Ford", model: "GT 40"), Car(make: "Jaguar", model: "F-Type")], [Car(make: "Chevrolet", model: "Camaro"), Car(make: "Honda", model: "S-2000")]]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cars[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
        
        let currentCar = self.cars[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = currentCar.make
        cell.detailTextLabel?.text = currentCar.model
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return self.section[section]
        } else {
            return self.section[section]
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cars[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
