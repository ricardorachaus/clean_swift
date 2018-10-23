//
//  Constants.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 23/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

enum OrderStatus: Int, CustomStringConvertible {
    case success
    case failure
    
    var description: String {
        let responses = ["Order Correct!", "Order Incorrect!"]
        return responses[rawValue]
    }
}
