//
//  ViewController.swift
//  CarTableView
//
//  Created by Amy Roberson on 1/14/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController, UITableViewDelegate, CarCreatorViewControllerDelegate {

    var dataSource = CarsDataSource()
    
    
    @IBOutlet weak var editStateButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
   
    @IBAction func editStateButton(_ sender: UIButton) {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
        
        // if possible update editing label
    }
    
    @IBAction func addCarButton(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name:"Main", bundle: nil)
        let creatorVC: CarCreatorViewController = storyBoard.instantiateViewController(withIdentifier: "CarCreator") as! CarCreatorViewController
        creatorVC.delegate = self
        let cars = dataSource.cars
        creatorVC.carSections = cars
        self.present(creatorVC, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    //moves car from one section to the other when editing is active
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let car = dataSource.cars[indexPath.section].remove(at: indexPath.row)
            if indexPath.section == 0 {
                dataSource.cars[1].insert(car, at: 0)
            } else {
                dataSource.cars[0].insert(car, at: 0)
            }
            tableView.reloadData()
    }
    
    
    func carCreatedComplete(_ viewController: CarCreatorViewController, cars: [[Car]]){
        self.dataSource.cars = cars
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }

}

