//
//  User.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/1/21.
//

import Foundation
class User:Codable {
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
    
    init(){
        id = ""
        name = ""
        email = ""
        phone = ""
        address = ""
        imgUrl = ""
        role = 1
    }
    
    func setUser(userInfo:NSDictionary){
        if let id = userInfo["id"] as? String,
           let name = userInfo["name"] as? String,
           let email = userInfo["email"] as? String,
           let phone = userInfo["phone"] as? String,
           let address = userInfo["address"] as? String,
           let imgUrl = userInfo["imgUrl"] as? String,
           let role = userInfo["role"] as? Int{
            self.id = id
            self.name = name
            self.email = email
            self.phone = phone
            self.address = address
            self.role = role
            self.imgUrl = imgUrl
        }else{
            fatalError("value not valid")
        }
       
    }
}
