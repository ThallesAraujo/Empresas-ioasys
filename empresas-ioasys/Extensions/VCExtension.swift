//
//  VCExtension.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 18/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit
extension UIViewController{
    
    func showErrorAlert(error: String){
        let alert = UIAlertController.init(title: "Houve um problema", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true)
    }
    
}
