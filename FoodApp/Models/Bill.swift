//
//  Bill.swift
//  FoodApp
//
//  Created by Bao Ngoc on 6/23/21.
//

import Foundation
import UIKit

class Bill{
    var id: String
    var invoices:[Invoice]
    var status:String
    var sumPrice:Int
    var userId:String
    static let COMFIRM_STATUS_TAG = "Confirming"
    init(id:String,invoices:[Invoice],status:String,sumPrice:Int,userId:String) {
        self.id = id
        self.invoices=invoices
        self.status = status
        self.sumPrice = sumPrice
        self.userId = userId
    }

}
