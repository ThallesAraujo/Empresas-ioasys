//
//  User.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper

infix operator <-

class User: NSObject, Mappable, NSCoding, NSSecureCoding {
    
    static var supportsSecureCoding: Bool = true
    
    var id: Int = 0
    var name: String = ""
    var email: String = ""
    var city: String = ""
    var country: String = ""
    var balance: Int = 0
    var photo: String = ""
    var portfolio_value: String = ""
    var super_angel: Int = 0
    
    var authUID: String = ""
    var accessToken: String = ""
    var tokenValidity: String = ""
    var clientID: String = ""
    var tokenType: String = "Bearer"
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["investor_name"]
        email <- map["email"]
        city <- map["city"]
        country <- map["country"]
        balance <- map["balance"]
        photo <- map["photo"]
        portfolio_value <- map["portfolio_value"]
        super_angel <- map["super_angel"]
        authUID <- map["uid"]
        accessToken <- map["access-token"]
        tokenValidity <- map["expiry"]
        clientID <- map["client"]
    }
    
    override init(){}
    
    required init?(map: Map) {}
    
    required init(coder decoder: NSCoder) {
        self.id = decoder.decodeInteger(forKey: "id")
        self.name = decoder.decodeObject(forKey: "name") as! String
        self.email = decoder.decodeObject(forKey: "name") as! String
        self.city = decoder.decodeObject(forKey: "city") as! String
        self.country = decoder.decodeObject(forKey: "country") as! String
        self.balance = decoder.decodeInteger(forKey: "balance")
        self.photo = decoder.decodeObject(forKey: "photo") as! String
        self.portfolio_value = decoder.decodeObject(forKey: "portfolio_value") as! String
        self.super_angel = decoder.decodeInteger(forKey: "super_angel")
        self.authUID  = decoder.decodeObject(forKey: "authUID") as! String
        self.accessToken = decoder.decodeObject(forKey: "accessToken") as! String
        self.tokenValidity = decoder.decodeObject(forKey: "tokenValidity") as! String
        self.clientID = decoder.decodeObject(forKey: "clientID") as! String
        self.tokenType = decoder.decodeObject(forKey: "tokenType") as! String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.id, forKey: "ID")
        coder.encode(self.name, forKey: "name")
        coder.encode(self.email, forKey: "email")
        coder.encode(self.city, forKey: "city")
        coder.encode(self.country, forKey: "country")
        coder.encode(self.balance, forKey: "balance")
        coder.encode(self.photo, forKey: "photo")
        coder.encode(self.portfolio_value, forKey: "portfolio_value")
        coder.encode(self.super_angel, forKey: "super_angel")
        coder.encode(self.authUID, forKey: "authUID")
        coder.encode(self.accessToken, forKey: "accessToken")
        coder.encode(self.tokenValidity, forKey: "tokenValidity")
        coder.encode(self.clientID, forKey: "clientID")
        coder.encode(self.tokenType, forKey: "tokenType")
    }
    
    
}
