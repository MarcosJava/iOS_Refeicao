//
//  Dao.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 31/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import Foundation

// Quando a Dao ficar maior, tera a necessidade de criar uma Dao para cada Models e criar uma pasta para Daos
class Dao {
    let mealsArchive: String
    let itemsArchive: String
    
    init(){
        
        let userDir = NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask,
            true)
        
        let dir = userDir[0] as String
        mealsArchive = "\(dir)/primeiraApp-meals"
        itemsArchive = "\(dir)/primeiraApp-items"
    }
    
    func saveMeals(meals: Array<Meal>){
        NSKeyedArchiver.archiveRootObject(
            meals, toFile: mealsArchive)
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded =
            NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as! Array
        }
        return Array<Meal>()
    }
    
    func saveItems(items: Array<Item>){
        NSKeyedArchiver.archiveRootObject(
            items, toFile: itemsArchive)
    }
    func loadItems() -> Array<Item> {
        if let loaded =
            NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as! Array
        }
        return Array<Item>()
    }
}