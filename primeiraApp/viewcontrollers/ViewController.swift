//
//  ViewController.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 22/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit


protocol AddAMealDelegate {
    func add(meal: Meal)
}


//TableViewDataSource = Para acoes de dados = qntidade, quem sera listado.
//TableViewDelegate = Toda acao na tabela, click, swipe, prees e outros.
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    var delegate:AddAMealDelegate?
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var happinessField: UITextField!
    
    var items = [ Item(name: "Eggplant Brownie", calories: 10),
                  Item(name: "Zucchini Muffin", calories: 10),
                  Item(name: "Cookie", calories: 10),
                  Item(name: "Coconut oil", calories: 500),
                  Item(name: "Chocolate frosting", calories: 1000),
                  Item(name: "Chocolate chip", calories: 1000)
    ]
    
    var selected:Array<Item> = [Item]()

    
    override func viewDidLoad() {
        
        let newItemButton = UIBarButtonItem(title: "new item", style: .Plain, target: self, action: #selector(ViewController.showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton
        
    }
    
    // delegador do addAnItemDelegate
    func addNew(item: Item) {
        items.append(item)
        tableView.reloadData()
    }
    
    @IBAction func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
    }
    
    

    @IBAction func add(sender: AnyObject) {
        
        if nameField.text == nil || happinessField.text == nil {
            return
        }
        
        let name:String = nameField.text!
        let happiness:String = happinessField.text!
        
        
        let meal = Meal(name: name, happiness: Int(happiness)!)
        meal.items = selected
        print("eaten: \(meal.name) \(meal.happiness) \(meal.items)")
        
        if delegate == nil {
            return
        }
        delegate!.add(meal)
        
        if let navigation = self.navigationController {
            navigation.popViewControllerAnimated(true)
        }
    }
    
    func tableView(tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell {
            let row = indexPath.row
            let item = items[ row ]
            let cell = UITableViewCell(style:
                UITableViewCellStyle.Default,reuseIdentifier: nil)
            cell.textLabel!.text = item.name
            return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
            if cell.accessoryType == UITableViewCellAccessoryType.None {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
                selected.append(items[indexPath.row])
                
            } else if cell.accessoryType == UITableViewCellAccessoryType.Checkmark {
                cell.accessoryType = UITableViewCellAccessoryType.None
                if let position = find(selected, toFind: items[indexPath.row]) {
                    selected.removeAtIndex(position)
                }
            }
        }
        
        print(selected)

    }
    
    func find(elements:Array<Item>, toFind:Item) -> Int? {
        
        let max = elements.count - 1;
        
        for i in 0...max {
            if toFind == elements[i] {
                return i
            }
        }
        return nil;
    }
    
}

