//
//  AuthRequestHandler.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit

class AuthRequestHandler: RequestHandler{
    
    func login(completion: @escaping () -> Void){
        if let vc = self.coordinator?.navigationController.viewControllers[0] as? VCLogin{
            
            let dispatcher = DispatchGroup()
            dispatcher.enter()
            AuthService.login(email: (vc.tfEmail?.text!)!, password: (vc.tfPassword?.text!)!, success: { (success) in
                if let coordinator = self.coordinator as? LoginCoordinator{
                    coordinator.start()
                    dispatcher.leave()
                }
            }) { (error) in
                if error.contains("credentials"){
                        vc.invalidCredentialsError()
                        dispatcher.leave()
                    
                }else{
                    vc.showErrorAlert(error: error)
                    dispatcher.leave()
                }
            }
            
            dispatcher.notify(queue: .main, execute: {
                completion()
            })
        }
    }
    
    
}
