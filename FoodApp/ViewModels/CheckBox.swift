//
//  CheckBox.swift
//  FoodApp
//
//  Created by Son Nguyen on 5/30/21.
//

import UIKit

@IBDesignable class CheckBox: UIButton {
    @IBInspectable var isCheck:Bool = false{
        didSet{
            updateCheck()
        }
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        //set title
        setTitle("", for: .normal)
        setTitleColor(.systemBackground, for: .normal)
        // create borde
        layer.cornerRadius = 5.0
        layer.borderWidth = 1
        layer.borderColor = UIColor.blue.cgColor
        
        //default width, height
        widthAnchor.constraint(equalToConstant: 20.0).isActive = true
        heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        // loading check img
        let bundle = Bundle(for: type(of: self))
        let checkedImg = UIImage(named: "check", in: bundle, compatibleWith: .none)
        
        setImage(checkedImg, for: .selected)

        //add event check
        addTarget(self, action: #selector(checkEvent(button:)), for: .touchUpInside)
        
    }
    
    //MARK: check event
    @objc private func checkEvent(button:UIButton){
        self.isCheck = !self.isCheck
        updateCheck()
    }
    
    private func updateCheck(){
        if(isCheck){
            self.isSelected = true
        }else{
            self.isSelected = false
        }
    }
}
