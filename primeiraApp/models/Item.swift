//
//  Item.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 24/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import Foundation

class Item: Equatable {
    
    var name:String 
    var calories:Double
    
    init(name:String , calories:Double){
        self.name = name
        self.calories = calories
    }
    
}

func ==(first:Item, second:Item) -> Bool {
    
    return first.name == second.name &&
        first.calories == second.calories
}