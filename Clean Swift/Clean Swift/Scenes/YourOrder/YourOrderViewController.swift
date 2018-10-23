//
//  YourOrderViewController.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 23/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import UIKit

protocol YourOrderDisplayLogic: class {
    func displayOrder(viewModel: YourOrder.YourOrder.ViewModel)
}

class YourOrderViewController: UIViewController, YourOrderDisplayLogic {
    var interactor: YourOrderBussinessLogic!
    var router: YourOrderRouter!
    
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var paymentMethodLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = YourOrder.YourOrder.Request.init(order: router.dataStore!.order!)
        interactor.processOrder(request: request)
    }
    
    private func setup() {
        let viewController = self
        let interactor = YourOrderInteractor()
        let presenter = YourOrderPresenter()
        let router = YourOrderRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func displayOrder(viewModel: YourOrder.YourOrder.ViewModel) {
        itemNameLabel.text = viewModel.order.item
        paymentMethodLabel.text = viewModel.order.paymentMethod
        valueLabel.text = viewModel.order.price
    }
    
    @IBAction func makeNewOrder(_ sender: UIButton) {
        router.performSegue(withIdentifier: "CreateOrder")
    }
}
