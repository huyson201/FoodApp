//
//  User.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/1/21.
//

import Foundation
class User {
    var id:String
    var name:String
    var email:String
    var phone:String
    var address:String
    var imgUrl:String?
    var role:Int
    
    init(id:String, name:String, email:String, phone:String, address:String) {
        self.id = id
        self.name = name
        self.email = email
        self.phone = phone
        self.address = address
        self.role = 1
        imgUrl = ""
    }
    
}
