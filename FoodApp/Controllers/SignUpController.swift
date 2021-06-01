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
        self.view.makeToast("require text field mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
        
        if let email = edtEmail.text,
           let password = edtPassword.text,
           let confirmPasswd = edtConfirmPasswd.text,
           let phone = edtPhone.text,
           let address = edtAddress.text,
           let name = edtName.text{
            
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
                            signUpDelegate.getEmail(email: "test email ne")
                        }
                        self.dismiss(animated: true, completion: nil)

                        
                    }
                
                }
                
            }
        }
        
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
