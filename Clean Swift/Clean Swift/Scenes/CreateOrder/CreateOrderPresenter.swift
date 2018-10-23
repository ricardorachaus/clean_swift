//
//  CreateOrderPresenter.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 22/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

protocol CreateOrderPresentationLogic {
    func present(response: CreateOrder.CreateOrder.Response)
}

class CreateOrderPresenter: CreateOrderPresentationLogic {
    weak var viewController: CreateOrderDisplayLogic!
    
    func present(response: CreateOrder.CreateOrder.Response) {
        switch response.status {
        case .success:
            let viewModel = CreateOrder.CreateOrder.ViewModel.init(statusText: response.status.description, status: response.status)
            viewController?.display(viewModel: viewModel)
        case .failure:
            let viewModel = CreateOrder.CreateOrder.ViewModel.init(statusText: response.status.description, status: response.status)
            viewController?.display(viewModel: viewModel)
        }
    }
}
