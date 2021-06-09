//
//  Category.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/2/21.
//

import Foundation
class Category  {
    var categoryId:String
    var categoryImg:String
    var cateogoryName:String
    
    init(categoryId:String, categoryImg:String, categoryName:String) {
        self.categoryId = categoryId
        self.categoryImg = categoryImg
        self.cateogoryName = categoryName
    }
    
    init(){
        self.categoryId = ""
        self.categoryImg = ""
        self.cateogoryName = ""
    }
    
    func setCategory(category:NSDictionary){
        if let ctId = category["categoryId"] as? String,
           let ctImg = category["categoryImg"] as? String,
           let ctName = category["categoryName"] as? String{
           
            self.categoryId = ctId
            self.categoryImg = ctImg
            self.cateogoryName = ctName
        }else{
            fatalError("category not invalid")
        }
    }
    
}
