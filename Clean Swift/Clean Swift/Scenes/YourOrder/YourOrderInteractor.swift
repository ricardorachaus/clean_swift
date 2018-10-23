//
//  YourOrderInteractor.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 23/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

protocol YourOrderBussinessLogic {
    func processOrder(request: YourOrder.YourOrder.Request)
}

protocol YourOrderDataStore {
    var order: Order? { get set }
}

class YourOrderInteractor: YourOrderBussinessLogic, YourOrderDataStore {
    var order: Order?
    var presenter: YourOrderPresentationLogic!
    
    func processOrder(request: YourOrder.YourOrder.Request) {
        let response = YourOrder.YourOrder.Response.init(order: request.order)
        presenter.present(response: response)
    }
}
