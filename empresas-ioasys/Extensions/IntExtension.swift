//
//  IntExtension.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
extension Int{
    
    public func formatCurrency() -> String {
        
        let formatter = NumberFormatter()
        
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.currencySymbol = "R$ "
        formatter.groupingSeparator = "."
        return formatter.string(from: NSNumber.init(integerLiteral: self))!
        
    }
    
}
