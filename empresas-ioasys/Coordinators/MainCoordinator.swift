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
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func goToVCEnterprises(){
        let vc = VCEnterprises.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        navigationController.viewControllers.remove(at: 0)
    }
    
    func goToEnterpriseDetails(enterprise: Enterprise?){
        let vc = VCEnterpriseDetails.instantiate()
        vc.setup(enterprise: enterprise, coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func sessionExpired(){
        let vc = VCLogin.instantiate()
        vc.sessionExpired = true
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

}
