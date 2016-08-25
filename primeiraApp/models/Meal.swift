//
//  Meal.swift
//  primeiraApp
//
//  Created by Marcos Felipe Souza on 24/08/16.
//  Copyright © 2016 Marcos. All rights reserved.
//

import Foundation


class Meal {
    
    var name:String
    var happiness:Int
    var items = Array<Item>()
    
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
}
