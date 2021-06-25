//
//  MainTableViewCell.swift
//  FoodApp
//
//  Created by Bao Ngoc on 6/24/21.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblMain: UILabel!
  
    @IBOutlet weak var insideTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension MainTableViewCell{
    func setTableViewDataSourceDelegate
    <D:UITableViewDelegate & UITableViewDataSource>
    (_ dataSourceDelegate:D, forRow:Int){
        insideTableView.delegate=dataSourceDelegate
        insideTableView.dataSource=dataSourceDelegate
        
        insideTableView.reloadData()
    }
}
