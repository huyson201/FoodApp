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
    
    init(){
        self.categoryId = ""
        self.foodDescription = ""
        self.foodId = ""
        self.foodImage = ""
        self.foodName  = ""
        self.foodPrice = 0
        
    }
    
    func setFood(mFood:NSDictionary){
        if let categoryId = mFood["categoryId"] as? String,
           let foodImg = mFood["foodImage"] as? String,
           let foodName = mFood["foodName"] as? String,
           let foodId = mFood["foodId"] as? String,
           let foodPrice = mFood["foodPrice"] as? Int,
           let foodDesc = mFood["foodDescription"] as? String{
            
            self.categoryId = categoryId
            self.foodName = foodName
            self.foodDescription = foodDesc
            self.foodPrice = foodPrice
            self.foodId = foodId
            self.foodImage = foodImg
        }else{
            fatalError("mfood is invalid")
        }
    }
}
