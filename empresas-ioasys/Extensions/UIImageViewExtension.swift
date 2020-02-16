//
//  UIImageViewExtension.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import UIKit
extension UIImageView{
    
    func roundCorners(){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}
