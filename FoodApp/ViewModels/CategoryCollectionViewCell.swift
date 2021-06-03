//
//  CategoryCollectionViewCell.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/2/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
      
    @IBOutlet weak var ctName: UILabel!
    
    @IBOutlet weak var ctImg: UIImageView!
    
    
        public func setup(category:Category){
            ctName.text = category.cateogoryName
            ctImg.image = UIImage(named: category.categoryImg)
        }
    
        override func awakeFromNib() {
            super.awakeFromNib()
            ctImg.layer.cornerRadius = 10
        }

}
