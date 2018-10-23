//
//  CreateOrderModel.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 22/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

enum CreateOrder {
    
    struct CreateOrder {
        struct Request {
            var order: Order
        }
        struct Response {
            var status: OrderStatus
        }
        struct ViewModel {
            var statusText: String
            var status: OrderStatus
        }
    }
}
