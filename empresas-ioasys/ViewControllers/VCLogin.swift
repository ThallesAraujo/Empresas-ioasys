//
//  VCLogin.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit
class VCLogin: UIViewController, Storyboarded {
    
    var coordinator: Coordinator?
    var sessionExpired = false
    
    @IBOutlet weak var tfEmail: UITextField?
    
    @IBOutlet weak var lblSessionExpiredWarning: UILabel!
    @IBOutlet weak var tfPassword: UITextField?
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.isHidden = true
        self.lblSessionExpiredWarning.isHidden = !self.sessionExpired
    }
    
    @IBAction func didTapLogin(_ sender: UIButton){
        
        AuthService.login(email: self.tfEmail!.text!, password: self.tfPassword!.text!, success: { (success) in
            print("Sucesso!")
            
            print("AuthUID -> \(SessionHelper.loadUser().authUID)")
            print("Client -> \(SessionHelper.loadUser().clientID)")
            print("Token -> \(SessionHelper.loadUser().accessToken)")
            
            if let coordinator = self.coordinator as? MainCoordinator{
                coordinator.goToVCEnterprises()
            }
            
        }) { (error) in
            print("Falhou! -> \(error)")
            let alert = UIAlertController.init(title: "There's a problem", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true)
        }
    
    }
    
}
