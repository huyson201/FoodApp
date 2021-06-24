//
//  ProfileController.swift
//  FoodApp
//
//  Created by My Mac on 6/19/21.
//

import UIKit
import Firebase
import FirebaseDatabase
class ProfileController: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblName2: UILabel!
    
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    var textField: UITextField?
    var fireDB = Database.database().reference()
    var user = UserDefaults.standard.getUserLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.async { [self] in
            if let url = URL(string: (user?.imgUrl)!){
                image.load(url: url)
            }
        }
       
        
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        //set data
        
        lblName.text = user?.name
        lblName2.text = user?.name
        lblEmail.text = user?.email
        lblAddress.text = user?.address
        lblPhone.text = user?.phone
        
      
        
        
        
        
    }
    @IBAction func changePicture(_ sender: UIButton) {
    }
    
    
    @IBAction func changeName(_ sender: UIButton) {
        dialog(str: "name", lbl: lblName2)
    }
    
    
    @IBAction func changeEmail(_ sender: UIButton) {
        dialog(str: "email", lbl: lblEmail)
    }
    
    @IBAction func changeAddress(_ sender: UIButton) {
        dialog(str: "address", lbl: lblAddress)
    }
    
    @IBAction func changePhone(_ sender: UIButton) {
     
            dialog(str: "phone", lbl: lblPhone)
        
       
      
        //print(user!.phone+"new ")
            //user!.phone = (self.lblPhone?.text)!
       // UserDefaults.standard.setUserLogin(user: user!)
        
       
    }
    
    
    @IBAction func logOut(_ sender: UIButton) {
        try! Auth.auth().signOut()
        UserDefaults.standard.signOut()
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    func dialog(str:String,lbl:UILabel){
        let dialog = UIAlertController(title: "Edit your \(str)", message: "", preferredStyle: .alert)
        let update=UIAlertAction(title: "Update", style: .default) { (action) in
            let updateValue = self.textField?.text
            lbl.text = updateValue
            switch str{
            case "name":
                self.lblName.text = updateValue
                self.user!.name = updateValue!
                break
            case "email":
                Auth.auth().currentUser?.updateEmail(to: updateValue!, completion:nil)
                self.user!.email = updateValue!
                break
            case "address":
                self.user!.email = updateValue!
                break
            case "phone":
                self.user!.email = updateValue!
                break
            default:
                break
            }
            DispatchQueue.main.async {
                UserDefaults.standard.setUserLogin(user: self.user!)
            }
            self.fireDB.child("users").child(self.user!.id).child(str).setValue(updateValue)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            dialog.dismiss(animated: true) {
                
            }
        }
        
        dialog.addAction(update)
        dialog.addAction(cancel)
        dialog.addTextField { (textField) in
            self.textField = textField
            self.textField?.text = lbl.text
        }
        self.present(dialog, animated: true, completion: nil)
        
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //Pass the selected object to the new view controller.
     //}
     
    
}
