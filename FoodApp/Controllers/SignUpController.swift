//
//  SignUpController.swift
//  FoodApp
//
//  Created by Son Nguyen on 5/30/21.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Toast_Swift

class SignUpController: UIViewController {

    @IBOutlet weak var edtName: UITextField!
    @IBOutlet weak var edtEmail: UITextField!
    @IBOutlet weak var edtPassword: UITextField!
    @IBOutlet weak var edtConfirmPasswd: UITextField!
    @IBOutlet weak var edtPhone: UITextField!
    @IBOutlet weak var edtAddress: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    var ref = Database.database().reference()
    
    var delegate:SignUpSuccessDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set border for sign up btn
        
        if let btnSignUp = btnSignUp{
            btnSignUp.layer.cornerRadius = 8
            btnSignUp.layer.borderWidth = 1
            btnSignUp.layer.borderColor = UIColor.blue.cgColor
        }
        
    }
    
    @IBAction func backLogin(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func clickSignUp(_ sender: Any) {
        //MARK: check text field is empty
        // check fullname empty
        let name = edtName.text!
        if name.isEmpty{
            self.view.makeToast("require full name mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
            return
        }
        
        // check email is empty
        
        let email = edtEmail.text!
        if email.isEmpty{
            self.view.makeToast("require email mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
            return
        }
        
        // check password is empty
        let password = edtPassword.text!
        if password.isEmpty{
            self.view.makeToast("require password mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
            return
        }
        
        // check confirm password
        let confirmPasswd = edtConfirmPasswd.text!
        if confirmPasswd.isEmpty{
            self.view.makeToast("require confirm password mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
            return
        }
        
        // check phone
        let phone = edtPhone.text!
        if phone.isEmpty{
            self.view.makeToast("require phone number mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
            return
        }
        
        // check address
        let address = edtAddress.text!
        if address.isEmpty{
            self.view.makeToast("require mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
            return
        }
        
        //check confirm password
        
        if confirmPasswd == password{
            Auth.auth().createUser(withEmail: email, password: password){authResult,error in
                
                if let auth = authResult{
                    let userUid = auth.user.uid
                    self.ref.child("users").child(userUid).setValue([
                        "id" : userUid,
                        "email" : email,
                        "name" : name,
                        "phone" : phone,
                        "address" : address,
                        "role" : 1,
                        "imgUrl" : ""
                    ] as [String : Any])
                    
                    if let signUpDelegate = self.delegate{
                        signUpDelegate.getEmail(email: email)
                    }
                    
                    self.dismiss(animated: true, completion: nil)

                }
            
            }
                
                    
        }else{
            self.view.makeToast("Confirm password is invalid", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
        }
        
    }
    
   
    
    

}
