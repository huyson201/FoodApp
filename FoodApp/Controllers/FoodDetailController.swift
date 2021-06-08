//
//  FoodDetailController.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/8/21.
//

import UIKit

class FoodDetailController: UIViewController {
    //MARK: properties
    var food:Food?
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var foodDesc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let food = food{
            foodImg.load(url: URL(string: food.foodImage)!)
            foodName.text = food.foodName
            foodPrice.text = "\(food.foodPrice)"
            foodDesc.text = food.foodDescription
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
