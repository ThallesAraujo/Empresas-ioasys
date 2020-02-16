//
//  AuthService.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import ObjectMapper
class AuthService{
    
    class func login(email: String, password: String, success: @escaping (_ success: String) -> Void, failure: @escaping (_ error: String) -> Void){
        
        Network.requestLogin(email: email, password: password, completion: { (response) in
            
            guard let fullResponse = response.result.value as? [String: Any] else{
                failure("Invalid JSON")
                return
            }
            
            guard let json = fullResponse["investor"] as? [String: Any] else{
                if let errors = fullResponse["errors"] as? [String]{
                    failure(errors[0])
                }else{
                    failure("Invalid JSON")
                }
                return
            }
            
            guard let headers = response.response?.allHeaderFields as? [String: Any] else{
                failure("Invalid session")
                return
            }
            
            if let result = fullResponse["success"] as? Int, result == 1{
                var userJoined = json
                userJoined.merge(with: headers)
                
                let user = Mapper<User>().map(JSON: userJoined)
                
                SessionHelper.setUser(user: user)
                success("User logged in")
            }else{
                failure("There's an error")
            }
            
        }) { (error) in
            failure(error)
        }
        
    }
    
}
