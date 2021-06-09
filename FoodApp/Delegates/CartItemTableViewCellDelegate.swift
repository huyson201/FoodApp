//
//  CartItemTableViewCellDelegate.swift
//  FoodApp
//
//  Created by Son Nguyen on 6/9/21.
//

import Foundation
protocol CartItemTableViewCellDelegate {
    func onClickPlus(cell:CartItemTableViewCell)
    func onClickMinus(cell:CartItemTableViewCell)
}
