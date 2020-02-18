//
//  EnterpriseDetailsCoordinator.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import UIKit

class EnterpriseDetailsCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var enterprise: Enterprise?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    
    func start() {}
    
    
    func goToFacebook(){
        if let facebook = self.enterprise?.facebook, facebook != ""{
            UIApplication.shared.open(URL(string: facebook)!, options: [:]) { _ in }
        }else{
            UIApplication.shared.open(URL(string: "https://m.facebook.com/public/\(self.enterprise!.enterprise_name.formatUrl())")!, options: [:]) { _ in }
        }
    }
    
    
    func goToTwitter(){
        if let twitter = self.enterprise?.twitter, twitter != ""{
            UIApplication.shared.open(URL(string: twitter)!, options: [:]) { _ in }
        }else{
            UIApplication.shared.open(URL(string: "https://mobile.twitter.com/search?q=\(self.enterprise!.enterprise_name.formatUrl())&src=typed_query")!, options: [:]) { _ in }
        }
    }
    
    func goToLinkedIn(){
        if let linkedin = self.enterprise?.linkedin, linkedin != ""{
            UIApplication.shared.open(URL(string: linkedin)!, options: [:]) { _ in }
        }else{
            UIApplication.shared.open(URL(string: "https://www.linkedin.com/search/results/all/?keywords=\(self.enterprise!.enterprise_name.formatUrl())&origin=GLOBAL_SEARCH_HEADER")!, options: [:]) { _ in }
        }
    }
    
    
}
