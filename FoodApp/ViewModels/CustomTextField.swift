//
//  CustomTextField.swift
//  FoodApp
//
//  Created by Son Nguyen on 5/30/21.
//

import UIKit

@IBDesignable class CustomTextField: UITextField {

    //MARK:properties
    
    @IBInspectable var cornerRadius:CGFloat = 0{
        didSet{
            layer.cornerRadius = self.cornerRadius
            layer.masksToBounds = self.cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0{
        didSet{
            layer.borderWidth = self.borderWidth
            layer.masksToBounds = true
        }
    }
    
    @IBInspectable var borderColor:UIColor? = UIColor.clear{
        didSet{
            layer.borderColor = self.borderColor?.cgColor
        }
    }
    
    @IBInspectable var leftIcon:UIImage = UIImage(){
        didSet{
            
            let imgView = UIImageView(frame: CGRect(x: -10.0, y: 0.0, width:self.leftIcon.size.width,height: self.leftIcon.size.height))
            imgView.image = self.leftIcon
            self.leftView = imgView
            self.leftViewMode = .always
        
        }
    }
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.cornerRadius
        self.layer.borderWidth = self.borderWidth
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
