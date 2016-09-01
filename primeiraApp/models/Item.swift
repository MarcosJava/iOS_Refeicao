//
//  Item.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 24/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding {
    
    var name:String 
    var calories:Double
    

    init(name:String , calories:Double){
        self.name = name
        self.calories = calories
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.calories = aDecoder.decodeDoubleForKey("calories")
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeDouble(self.calories, forKey: "calories")
    }
    
}

func ==(first:Item, second:Item) -> Bool {
    
    return first.name == second.name &&
        first.calories == second.calories
}