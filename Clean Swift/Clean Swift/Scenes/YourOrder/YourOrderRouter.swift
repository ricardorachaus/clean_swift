//
//  YourOrderRouter.swift
//  Clean Swift
//
//  Created by Ricardo Rachaus on 23/10/18.
//  Copyright © 2018 Ricardo Rachaus. All rights reserved.
//

import Foundation

protocol YourOrderRoutingLogic {
    func performSegue(withIdentifier: String)
}

protocol YourOrderDataPassing {
    var dataStore: YourOrderDataStore? { get }
}

class YourOrderRouter: YourOrderRoutingLogic, YourOrderDataPassing {
    weak var viewController: YourOrderViewController!
    var dataStore: YourOrderDataStore?
    
    func performSegue(withIdentifier: String) {
        viewController.performSegue(withIdentifier: withIdentifier, sender: viewController)
    }
}
