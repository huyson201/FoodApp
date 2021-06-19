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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //userName.text = UserDefaults.standard.getUserLogin()?.email
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
