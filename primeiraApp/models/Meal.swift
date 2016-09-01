//
//  Meal.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 24/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import Foundation


class Meal : NSObject, NSCoding{
    
    var name:String
    var happiness:Int
    var items = Array<Item>()
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.happiness =
            aDecoder.decodeIntegerForKey("happiness")
        self.items =
            aDecoder.decodeObjectForKey("items") as! Array<Item>
    }
    
    init(name:String, happiness:Int){
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        print("Calculando")
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
    
    func details() -> String {
        var message = "Happiness: \(self.happiness)"
        for item in self.items {
            message
                += "\n * \(item.name) - calories: \(item.calories)"
        }
        return message
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeInteger(self.happiness, forKey: "happiness")
        aCoder.encodeObject(self.items, forKey: "items")
    }
}
