//
//  ViewController.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 22/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var delegate:AddAMealDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var happinessField: UITextField!
    
    

    @IBAction func add(sender: AnyObject) {
        
        if nameField.text == nil || happinessField.text == nil {
            return
        }
        
        let name:String = nameField.text!
        let happiness:String = happinessField.text!
        
        
        let meal = Meal(name: name, happiness: Int(happiness)!)
        
        print("eaten: \(meal.name) \(meal.happiness)")
        
        if delegate == nil {
            return
        }
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
    
}

