//
//  YourOrderPresenter.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 23/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

protocol YourOrderPresentationLogic {
    func present(response: YourOrder.YourOrder.Response)
}

class YourOrderPresenter: YourOrderPresentationLogic {
    weak var viewController: YourOrderDisplayLogic!
    
    func present(response: YourOrder.YourOrder.Response) {
        let viewModel = YourOrder.YourOrder.ViewModel.init(order: response.order)
        viewController.displayOrder(viewModel: viewModel)
    }
}
