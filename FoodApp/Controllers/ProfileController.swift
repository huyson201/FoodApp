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
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = UserDefaults.standard.getUserLogin()
        
        //set data
        lblName.text = user?.name
        lblName2.text = user?.name
        lblEmail.text = user?.email
        lblAddress.text = user?.address
        lblPhone.text = user?.phone
        if let url = URL(string: (user?.imgUrl)!){
            image.load(url: url)
        }
    
        
        image.layer.cornerRadius = image.frame.size.width / 2
        image.layer.masksToBounds = false
        image.clipsToBounds = true
        
        print("image"+(user?.imgUrl)!)
        // Do any additional setup after loading the view.
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
