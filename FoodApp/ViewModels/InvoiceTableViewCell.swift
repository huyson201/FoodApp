//
//  InvoiceTableViewCell.swift
//  FoodApp
//
//  Created by Bao Ngoc on 6/24/21.
//

import UIKit

class InvoiceTableViewCell: UITableViewCell {

    @IBOutlet weak var foodPrice: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
