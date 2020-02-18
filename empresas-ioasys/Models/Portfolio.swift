//
//  Portfolio.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper

class Portfolio: Mappable{
    
    var enterprises_number: Int = 0
    var enterprises: [Enterprise] = []
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        enterprises_number <- map["enterprises_number"]
        enterprises <- map["enterprises"]
    }
    
}
