//
//  LoginCoordinator.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit
class LoginCoordinator: Coordinator{
    
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = VCEnterprises.instantiate()
        vc.coordinator = EnterprisesCoordinator.init(navigationController: self.navigationController)
        self.navigationController.pushViewController(vc, animated: true)
        self.navigationController.viewControllers.remove(at: 0)
    }
    
    func sessionExpired(){
        let vc = VCLogin.instantiate()
        vc.sessionExpired = true
        vc.coordinator = MainCoordinator.init(navigationController: self.navigationController)
        navigationController.pushViewController(vc, animated: false)
        self.childCoordinators.append(vc.coordinator!)
    }
    
    
    
}
