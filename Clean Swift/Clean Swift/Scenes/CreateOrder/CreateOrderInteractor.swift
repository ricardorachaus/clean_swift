//
//  CreateOrderInteractor.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 22/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

protocol CreateOrderBussinessLogic {
    func createOrder(request: CreateOrder.CreateOrder.Request)
}

protocol CreateOrderDataStore {
    var order: Order? { get set }
}

class CreateOrderInteractor: CreateOrderBussinessLogic, CreateOrderDataStore {
    var presenter: CreateOrderPresentationLogic!
    var order: Order?
    
    func createOrder(request: CreateOrder.CreateOrder.Request) {
        if !(request.order.item.isEmpty || request.order.paymentMethod.isEmpty ||
             request.order.price.isEmpty) {
            let response = CreateOrder.CreateOrder.Response.init(status: .success)
            self.order = request.order
            presenter?.present(response: response)
        } else {
            let response = CreateOrder.CreateOrder.Response.init(status: .failure)
            presenter?.present(response: response)
        }
    }
}
