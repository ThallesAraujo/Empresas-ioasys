//
//  SessionHelper.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
class SessionHelper{
    
    static func loadUser() -> User {
        let defaults = UserDefaults.standard
        var user : User = User()
        if let encodedUser = defaults.data(forKey: "user") {
            user = try! NSKeyedUnarchiver.unarchivedObject(ofClass: User.self, from: encodedUser)!
            return user
        } else {
            return user
        }
    }
    
    static func setUser(user: User?) {
        let defaults = UserDefaults.standard
        let encodedUser: NSData = try! NSKeyedArchiver.archivedData(withRootObject: user!, requiringSecureCoding: true) as NSData
        defaults.set(encodedUser, forKey: "user")
        defaults.synchronize()
    }
    
    static func removeUser() {
        let defaults = UserDefaults.standard
        let user : User = User()
        let encodedUser: NSData = try! NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: true) as NSData
        defaults.set(encodedUser, forKey: "user")
        defaults.synchronize()
    }
    
}




