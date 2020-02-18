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
    var requestHandler = AuthRequestHandler()
    
    @IBOutlet weak var lblWarning: UILabel!
    
    @IBOutlet weak var tfEmail: FormField?
    @IBOutlet weak var tfPassword: FormField?
    @IBOutlet weak var btEnter: CustomButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        
        if self.sessionExpired{
            self.lblWarning.text = "Sua sessão expirou. Faça login novamente para continuar utilizando a aplicação"
        }
        self.navigationController?.navigationBar.isHidden = true
        self.lblWarning.isHidden = !self.sessionExpired
        self.requestHandler.coordinator = self.coordinator
        self.spinner.isHidden = true
    }
    
    @IBAction func didTapLogin(_ sender: UIButton){
        self.spinner.isHidden = false
        self.spinner.startAnimating()
        self.requestHandler.login(completion: {
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        })
    }
    
    func invalidCredentialsError(){
        self.tfEmail?.invalidate()
        self.tfPassword?.invalidate()
        self.tfPassword?.addTarget(self, action: #selector(self.reenableLoginButton(_:)), for: .editingChanged)
        self.tfEmail?.addTarget(self, action: #selector(self.reenableLoginButton(_:)), for: .editingChanged)
        self.showWarning("Credenciais informadas são inválidas, tente novamente.")
        self.btEnter.disable()
    }
    
    func showWarning(_ warning: String){
        self.lblWarning.isHidden = false
        self.lblWarning.text = warning
    }
    
    @objc func reenableLoginButton(_ sender: Any){
        self.btEnter.enable()
    }
    
}
