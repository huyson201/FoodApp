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
    @IBOutlet weak var addToCart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let food = food{
            foodImg.load(url: URL(string: food.foodImage)!)
            foodName.text = food.foodName
            foodPrice.text = "\(food.foodPrice)"
            foodDesc.text = food.foodDescription
            
        }
    }
    
    
   // @IBAction func buyNow(_ sender: Any) {
     //   if let food = food{
       //   let invoiceNow = Invoice(food: food, quantity: 1)
         //   invoiceNow.isSelected=true
           // CartController.invoices.append(invoiceNow)
          
       //self.performSegue(withIdentifier: "cart", sender: self)
        //}
        
    //}
    
    // MARK: - Navigation
    @IBAction func addToCartClick(_ sender: Any) {
            if let food = food{
                var check = false
              let invoice = Invoice(food: food, quantity: 1)
            
                if CartController.invoices.count==0 {
                    CartController.invoices.append(invoice)
                }else{
                    for invoiceCart in CartController.invoices{
                        if invoice.food.foodId == invoiceCart.food.foodId{
                            invoiceCart.quantity+=1
                            check = true
                            break;
                        }
                       
                    }
                    if(!check){
                        CartController.invoices.append(invoice)
                    }
                }

                //self.dismiss(animated: true)
                self.performSegue(withIdentifier: "cart", sender: self)
                // present(HomeTabBarController(), animated: true)
           //self.performSegue(withIdentifier: "cart", sender: self)
        }
      
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      //  if let cartController = segue.destination as? CartController{
        //    cartController.invoices=listCart
        //}
    //}
    
    
    
}
