//
//  MainCoordinator.swift
//  swift-issues
//
//  Created by Thalles Araújo on 08/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

//Default implementation for Coordinator Pattern
//IMPORTANT: All view controllers identifiers should be setted properly!

import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = VCLogin.instantiate()
        vc.coordinator = LoginCoordinator(navigationController: self.navigationController)
        navigationController.pushViewController(vc, animated: false)
        self.childCoordinators.append(vc.coordinator!)
    }

}
