//
//  Invoice.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/9/21.
//

import Foundation
import UIKit

class Invoice{
    var food:Food
    var quantity:Int
    var isSelected:Bool = false
    
    init(food:Food, quantity:Int = 1){
        self.food = food
        self.quantity = quantity
    }
}
