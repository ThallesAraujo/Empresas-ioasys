//
//  EnterpriseRequestHandler.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit

//Remove a responsabilidade do ViewController de chamar os services
//Trata erros de requisição

class EnterpriseRequestHandler: RequestHandler{
    
    func loadEnterprises(completion: @escaping ([Enterprise])-> Void){
        
        let dispatcher = DispatchGroup()
        
        dispatcher.enter()
        
        EnterpriseService.getEnterprises(success: { (enterprises) in
            completion(enterprises)
            dispatcher.leave()
        }) { (error) in
            if error.contains("session"){
                if let coordinator = self.coordinator as? LoginCoordinator{
                    coordinator.sessionExpired()
                }
            }else{
                self.coordinator?.navigationController.viewControllers[0].showErrorAlert(error: error)
                dispatcher.leave()
            }
        }
        
        dispatcher.notify(queue: .main, execute: {})
    }
    
}
