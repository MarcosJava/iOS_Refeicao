//
//  MealsTableViewController.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 25/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate{
    
    var meals = [ Meal(name: "Eggplant brownie", happiness: 5),
                  Meal(name: "Zucchini Muffin", happiness: 3)]

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        let meal = meals[indexPath.row]
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        return cell
    }
    
    func add(meal: Meal){
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "addMeal") {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self;
        }
    }
    

}
