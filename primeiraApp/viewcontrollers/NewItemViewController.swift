//
//  NewItemViewController.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 28/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit


protocol AddAnItemDelegate {
    func addNew(item:Item)
}

class NewItemViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    
    let delegate:AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName: "NewItemViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @IBAction func addNewItem(sender: AnyObject) {
        
        
        if let nome = nameField.text {
            if  let calories = caloriesField.text {
                
                let caloriesDouble = NSString(string: calories).doubleValue
                let item = Item(name: nome, calories: caloriesDouble)
                
                if delegate == nil {
                    return
                }
                
                delegate!.addNew(item)
                
                print(" \(item.name)  \(item.calories)")
                
            }
        }
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }

}
