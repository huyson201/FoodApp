//
//  extension.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/3/21.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension UserDefaults{
    func setRememberLogin(value:Bool){
        self.setValue(value, forKey: LoginController.REMEBER_LOGIN_TAG)
    }
    
    func getRememberLogin()->Bool{
        var value = false
        if let result = self.value(forKey: LoginController.REMEBER_LOGIN_TAG) as? Bool{
            value = result
        }
        return value
    }
    
    func setUserLogin(user:User){
        let encode = JSONEncoder()
        if let encoded = try? encode.encode(user){
            self.setValue(encoded, forKey: LoginController.USER_LOGGED_IN_TAG)
        }
       
    }
    
    func getUserLogin()->User?{
        if let userLogin = self.value(forKey: LoginController.USER_LOGGED_IN_TAG) as? Data{
            let decode = JSONDecoder()
            if let user = try? decode.decode(User.self, from: userLogin){
                return user
            }
            
        }
        return nil
    }
    
    func signOut(){
        self.removeObject(forKey: LoginController.USER_LOGGED_IN_TAG)
        self.setRememberLogin(value: false)
    }
    
    
}
