//
//  EnterpriseType.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper
class EnterpriseType{
    
    var id: Int = 0
    var enterprise_name_type: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        enterprise_name_type <- map["enterprise_type_name"]
        
    }
}
