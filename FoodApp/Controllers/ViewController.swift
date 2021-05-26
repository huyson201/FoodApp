//
//  ViewController.swift
//  FoodApp
//
//  Created by Son Nguyen on 5/25/21.
//

import UIKit
import FirebaseDatabase
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference();
        ref.child("demo").setValue("demo")
    
    }


}

