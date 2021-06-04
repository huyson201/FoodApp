//
//  Food.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/4/21.
//

import Foundation
class Food{
    var categoryId:String
    var foodDescription:String
    var foodId:String
    var foodImage:String
    var foodName:String
    var foodPrice:Int
    
    init(categoryId:String, foodDescription:String, foodId:String, foodImage:String, foodName:String, foodPrice:Int) {
        self.categoryId = categoryId
        self.foodDescription = foodDescription
        self.foodId = foodId
        self.foodImage = foodImage
        self.foodName  = foodName
        self.foodPrice = foodPrice
    }
    
}
