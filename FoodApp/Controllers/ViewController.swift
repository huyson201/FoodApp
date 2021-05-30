//
//  ViewController.swift
//  FoodApp
//
//  Created by Son Nguyen on 5/25/21.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController {
    //MARK: properties
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // disign login btn
        loginBtn.layer.borderWidth = 1
        loginBtn.layer.borderColor = UIColor.blue.cgColor
        loginBtn.layer.cornerRadius = 8
    
    }


}

