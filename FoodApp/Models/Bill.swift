//
//  Bill.swift
//  FoodApp
//
//  Created by Bao Ngoc on 6/23/21.
//

import Foundation
import UIKit

class Bill{
    var invoices:[Invoice]
    var sumPrice:Int
    
    init(invoices:[Invoice],sumPrice:Int) {
        self.invoices=invoices
        self.sumPrice=sumPrice
    }

}
