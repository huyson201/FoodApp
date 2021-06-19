//
//  ProfileController.swift
//  FoodApp
//
//  Created by My Mac on 6/19/21.
//

import UIKit

class ProfileController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblName2: UILabel!
    
    
    @IBOutlet weak var lblEmail: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPhone: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    var textField: UITextField?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = UserDefaults.standard.getUserLogin()
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
        //set data
        lblName.text = user?.name
        lblName2.text = user?.name
        lblEmail.text = user?.email
        lblAddress.text = user?.address
        lblPhone.text = user?.phone
        if let url = URL(string: (user?.imgUrl)!){
            image.load(url: url)
        }
    
        
        
        
    
    }
    @IBAction func changePicture(_ sender: UIButton) {
    }
    
    
    @IBAction func changeName(_ sender: UIButton) {
        dialog(field: "abc", lbl: lblName2)
    }
    
    
    @IBAction func changeEmail(_ sender: UIButton) {
    }
    
    @IBAction func changeAddress(_ sender: UIButton) {
    }
    
    @IBAction func changePhone(_ sender: UIButton) {
    }
    
    
    @IBAction func logOut(_ sender: UIButton) {
        
    }

    func dialog(field:String,lbl:UILabel){
        let dialog = UIAlertController(title: "Edit...", message: "Edit", preferredStyle: .alert)
        let update=UIAlertAction(title: "Update", style: .default) { (action) in
            let updateValue = self.textField?.text
            lbl.text = updateValue
            
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            
        }
        dialog.addAction(update)
        dialog.addAction(cancel)
        dialog.addTextField { (textField) in
            self.textField = textField
            self.textField?.text = lbl.text
        }
        self.present(dialog, animated: true, completion: nil)
        
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
