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
    
    static let USER_LOGGED_IN_TAG = "userLogged"
    static let REMEBER_LOGIN_TAG = "remember"
    
    var ref = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // disign login btn
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.blue.cgColor
        loginBtn.layer.cornerRadius = 8
        
      
      
    }
    
    // check remember password, if true go to next screen
    override func viewDidAppear(_ animated: Bool) {
//        let remember = UserDefaults.standard.getRememberLogin()
//
//        if remember{
//            self.performSegue(withIdentifier: "LoginSegue", sender: nil)
//        }
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
                    
                }else{
                    if let user = Auth.auth().currentUser{
                        let userUid = user.uid
                        
                        self!.ref.child("users/\(userUid)").getData{ (error, snapshot) in
                            
                            if snapshot.exists(){
                                        
                                let userInfo = snapshot.value! as?NSDictionary ?? [:]
                                let userLogged = User()
                                userLogged.setUser(userInfo: userInfo)
                                UserDefaults.standard.setUserLogin(user:userLogged)
                                
                                if self!.chkRemember.isCheck{
                                    UserDefaults.standard.setRememberLogin(value: true)
                                }else{
                                    UserDefaults.standard.setRememberLogin(value: false)
                                }
                            }
                        }
                        
                        self!.performSegue(withIdentifier: "LoginSegue", sender: nil)
                        
                    }
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

