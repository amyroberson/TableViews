//
//  CarCreatorViewContoller.swift
//  CarTableView
//
//  Created by Amy Roberson on 1/16/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

protocol CarCreatorViewControllerDelegate: NSObjectProtocol {
    func carCreatedComplete(_ viewController: CarCreatorViewController, cars: [[Car]])
    
}

class CarCreatorViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: CarCreatorViewControllerDelegate?
    var carSections: [[Car]] = [[]]
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var haveORWantTextField: UITextField!
    @IBOutlet weak var notEnoughLabel: UILabel!
    
    
    
    
    @IBAction func addCarButton(_ sender: UIButton) {
        if let make = validateText(inside: makeTextField), let model = validateText(inside: modelTextField){
            var section = 0
            if haveORWantTextField.text == "have" || haveORWantTextField.text == "Have" {
                section = 1
            } else {
                section = 0
            }
            let car = Car(make: make, model: model)
            carSections[section].insert(car, at: 0)
            delegate?.carCreatedComplete(self, cars: carSections)
        } else {
            notEnoughLabel.isHidden = false
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        notEnoughLabel.isHidden = true
        makeTextField.delegate = self
        modelTextField.delegate = self
        haveORWantTextField.delegate = self
    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty == false {
            textField.resignFirstResponder()
            return true
        }
        return false
    }
    
    func validateText(inside field: UITextField) -> String? {
        if let text = field.text, text.isEmpty == false {
            return text
        } else {
            return nil
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let _ = validateText(inside: textField){
            textField.resignFirstResponder()
            return true
        } else {
            return false
        }
    }
    
    
}
