//
//  OrderedItemTableViewCell.swift
//  FoodApp
//
//  Created by Bao Ngoc on 6/23/21.
//

import UIKit

class OrderedItemTableViewCell: UITableViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var total: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

extension OrderedItemTableViewCell{
    func setTableViewDataSourceDelegate
    <D:UITableViewDelegate & UITableViewDataSource>
    (_ dataSourceDelegate:D, forRow:Int){
        tableView.delegate=dataSourceDelegate
        tableView.dataSource=dataSourceDelegate
        
        tableView.reloadData()
    }
}
