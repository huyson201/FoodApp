//
//  MenuTableViewCell.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/3/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var lblFoodName:UILabel!
    @IBOutlet weak var lblFoodPrice:UILabel!
    @IBOutlet weak var foodImg:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
