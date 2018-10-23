//
//  ViewController.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 22/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import UIKit

protocol CreateOrderDisplayLogic: class {
    func display(viewModel: CreateOrder.CreateOrder.ViewModel)
}

class CreateOrderViewController: UIViewController, CreateOrderDisplayLogic {

    var interactor: CreateOrderBussinessLogic!
    var router: CreateOrderRouter!
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var paymentMethodTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var orderStatusLabel: UILabel!
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = CreateOrderInteractor()
        let presenter = CreateOrderPresenter()
        let router = CreateOrderRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    @IBAction func requestOrder(_ sender: UIButton) {
        if let itemText = itemTextField.text,
           let paymentText = paymentMethodTextField.text,
           let priceText = priceTextField.text {
            let order = Order(item: itemText, paymentMethod: paymentText, price: priceText)
            let request = CreateOrder.CreateOrder.Request.init(order: order)
            interactor.createOrder(request: request)
        }
    }
    
    func display(viewModel: CreateOrder.CreateOrder.ViewModel) {
        orderStatusLabel.text = viewModel.statusText
        if viewModel.status == .success {
            router.perfomSegue(withIdentifier: "YourOrder")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.prepare(for: segue)
    }
    
}

