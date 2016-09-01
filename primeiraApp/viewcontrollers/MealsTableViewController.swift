//
//  MealsTableViewController.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 25/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate{
    
    //var meals = [ Meal(name: "Eggplant brownie", happiness: 5),
      //            Meal(name: "Zucchini Muffin", happiness: 3)]

    var meals = Array<Meal>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        meals = Dao().loadMeals()
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        let meal = meals[indexPath.row]
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: Selector("showDetails:"))
        cell.addGestureRecognizer(longPress)
        return cell
    }
    
    var selectedMeal:Meal?
    
    func showDetails(recognize: UILongPressGestureRecognizer){
     
        if recognize.state == UIGestureRecognizerState.Began {
            
            let cell = recognize.view as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            if indexPath == nil {
                return
            }
            let row = indexPath!.row
            let meal = meals[ row ]
            
            RemoveMealController(controller: self).show(meal,
                                                        handler: { action in
                                                            self.meals.removeAtIndex(row)
                                                            self.tableView.reloadData()
            })

            Dao().saveMeals(self.meals)
        }
    }
    
    
    
    func add(meal: Meal){
        meals.append(meal)
        Dao().saveMeals(meals)
        tableView.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "addMeal") {
            let view = segue.destinationViewController as! ViewController
            view.delegate = self;
        }
    }
    

}
