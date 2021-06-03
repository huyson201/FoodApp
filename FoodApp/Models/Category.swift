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
    
}
