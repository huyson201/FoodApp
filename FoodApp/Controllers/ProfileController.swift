//
//  ProfileController.swift
//  FoodApp
//
//  Created by My Mac on 6/19/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class ProfileController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblName2: UILabel!
    
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    var textField: UITextField?
    var fireDB = Database.database().reference()
    var fireStorage = Storage.storage().reference()
    var user = UserDefaults.standard.getUserLogin()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: (user?.imgUrl)!){
            image.load(url: url)
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
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        guard let imageData = image.pngData() else{
            return
        }
        
        //upload image
        self.fireStorage.child("users").child(self.user!.id).putData(imageData, metadata: nil) { (_, error) in
            guard error == nil else {
                print("Failed to upload")
                return
                
            }
            // download image url
            self.fireStorage.child("users").child(self.user!.id).downloadURL { (url, error) in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteString
                //change image user
                self.user?.imgUrl = urlString
                // change to image
                if let url = URL(string: (self.user?.imgUrl)!){
                    self.image.load(url: url)
                }
                //change url in database
                self.fireDB.child("users").child(self.user!.id).child("imgUrl").setValue(urlString)
                //set user data
                DispatchQueue.main.async {
                    UserDefaults.standard.setUserLogin(user: self.user!)
                }
            }
        }
        
        
        
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
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
            if !((self.textField?.text!.isEmpty)!){
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
            }else{
                self.view.makeToast("require your \(str) mustn't empty", duration: 2.0, position: .center, title: "Error!", image:nil, completion: nil)
            }
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
