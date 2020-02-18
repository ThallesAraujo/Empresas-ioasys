//
//  EnterprisesCoordinator.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
class EnterprisesCoordinator: Coordinator{
    
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    var enterprise: Enterprise?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = VCEnterpriseDetails.instantiate()
        vc.setup(enterprise: self.enterprise, coordinator: EnterpriseDetailsCoordinator(navigationController: self.navigationController))
        navigationController.pushViewController(vc, animated: true)
        self.childCoordinators.append(vc.coordinator!)
    }
    
    func goToSearch(){
        if let previousVC = self.navigationController.viewControllers[0] as? VCEnterprises{
            let vc = VCSearch.instantiate()
            vc.coordinator = self
            vc.enterprises = previousVC.enterprises
            navigationController.pushViewController(vc, animated: true)
            self.childCoordinators.append(vc.coordinator!)
        }
    }
    
    
    
}
