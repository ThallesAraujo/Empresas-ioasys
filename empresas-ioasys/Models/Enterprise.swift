//
//  File.swift
//  swift-issues
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper

infix operator <-

class Enterprise: Mappable {
    
    var id: Int = 0
    var email_enterprise: String = ""
    var facebook: String = ""
    var twitter: String = ""
    var linkedin: String = ""
    var phone: String = ""
    var own_enterprise: Bool?
    var enterprise_name: String = ""
    var photo: String = ""
    var description: String = ""
    var city: String = ""
    var country: String = ""
    var value: Double?
    var share_price: Double?
    var enterprise_type: EnterpriseType?
    
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        email_enterprise <- map["email_enterprise"]
        facebook <- map["facebook"]
        twitter <- map["twitter"]
        linkedin <- map["linkedin"]
        phone <- map["phone"]
        own_enterprise <- map["own_enterprise"]
        enterprise_name <- map["enterprise_name"]
        photo <- map["photo"]
        description <- map["description"]
        city <- map["city"]
        country <- map["country"]
        value <- map["value"]
        share_price <- map["share_price"]
        enterprise_type <- map["enterprise_type"]
    }
    
    
    
}
