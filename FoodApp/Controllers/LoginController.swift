//
//  LoginController.swift
//  FoodApp
//
//  Created by Son Nguyen on 5/25/21.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Toast_Swift

class LoginController: UIViewController, SignUpSuccessDelegate, UINavigationControllerDelegate {
   
    
    //MARK: properties
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var edtEmail: UITextField!
    
    @IBOutlet weak var edtPassword: UITextField!
    
    @IBOutlet weak var chkRemember: CheckBox!
    
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // disign login btn
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.blue.cgColor
        loginBtn.layer.cornerRadius = 8
    
    }

    @IBAction func clickLogin(_ sender: Any) {
        
        let email = edtEmail.text!
        let password = edtPassword.text!
        
        if email.isEmpty{
            self.view.makeToast("require email mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
        }
        else if password.isEmpty{
            self.view.makeToast("require password mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
        }
        else{
            
            Auth.auth().signIn(withEmail: email, password: password){[weak self] authResult, error in
                
                if error != nil{
                    self!.view.makeToast("Email / password is invalid", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
                }
                
                
                if let user = Auth.auth().currentUser{
                    let userUid = user.uid
                    var userLogged:User?
                    self!.ref.child("users/\(userUid)").getData{ (error, snapshot) in
                        
                        if snapshot.exists(){
                            let userInfo = snapshot.value! as?NSDictionary ?? [:]
                            
                            userLogged = User(id: userInfo["id"] as! String, name: userInfo["name"] as! String, email: userInfo["email"] as! String, phone: userInfo["phone"] as! String, address: userInfo["address"] as! String)
                            
                        }
                    }
                    
                    self?.performSegue(withIdentifier: "LoginSegue", sender: nil)
                      
                }
                
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "signup"{
            
            
            if let sourceControler = segue.destination as? SignUpController{
                sourceControler.delegate = self
            }
        }
        
    }
  
    func getEmail(email: String) {
        edtEmail.text = email
    }
}

