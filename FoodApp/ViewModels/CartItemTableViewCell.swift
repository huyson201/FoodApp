//
//  CartItemTableViewCell.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/9/21.
//

import UIKit

class CartItemTableViewCell: UITableViewCell {
    //MARK:properties
    
    @IBOutlet weak var foodImg: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var lblQuantity: UILabel!
    
    var delegate:CartItemTableViewCellDelegate?
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setInvoice(invoice:Invoice){
        foodName.text = invoice.food.foodName
        foodPrice.text = "\(invoice.food.foodPrice)"
        lblQuantity.text = "\(invoice.quantity)"
        foodImg.load(url: URL(string: invoice.food.foodImage)!)        //foodImg.image = UIImage(named: invoice.food.foodImage)
    }
    
    @IBAction func clickPlus(_ sender: Any) {
        if delegate != nil{
            delegate!.onClickPlus(cell: self)
        }
    }
    
    @IBAction func clickMinus(_ sender: Any) {

        if delegate != nil{
            delegate!.onClickMinus(cell: self)
        }
    }
}
