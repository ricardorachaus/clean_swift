//
//  Order.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 23/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

struct Order {
    var item: String
    var paymentMethod: String
    var price: String
    
    init(item: String, paymentMethod: String, price: String) {
        self.item = item
        self.paymentMethod = paymentMethod
        self.price = price
    }
}
