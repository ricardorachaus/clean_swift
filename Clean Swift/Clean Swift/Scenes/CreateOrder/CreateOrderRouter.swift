//
//  CreateOrderRouter.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 22/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import UIKit

protocol CreateOrderRoutingLogic {
    func prepare(for segue: UIStoryboardSegue)
    func perfomSegue(withIdentifier: String)
}

protocol CreateOrderDataPassing {
    var dataStore: CreateOrderDataStore? { get }
}

class CreateOrderRouter: CreateOrderRoutingLogic {
    weak var viewController: CreateOrderViewController!
    var dataStore: CreateOrderDataStore?
    
    private weak var destination: YourOrderViewController?
    
    func prepare(for segue: UIStoryboardSegue) {
        destination = segue.destination as? YourOrderViewController
        destination?.router.dataStore?.order = dataStore?.order
    }
    
    func perfomSegue(withIdentifier: String) {
        viewController.performSegue(withIdentifier: withIdentifier, sender: viewController)
    }
}
