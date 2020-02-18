//
//  APIHelper.swift
//  swift-issues
//
//  Created by Thalles Araújo on 26/01/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
enum APIHelper: String{
    
    
    case ENTERPRISES =  "enterprises"
    case AUTH =  "users/auth/sign_in"
    
    
    func getURL(_ parameters: [String] = []) -> URL {
        let host = ConfigScheme.API_URL //Replace for variables defined in ConfigScheme
        var service = self.rawValue
        if parameters.count > 0 {
            service = String(format: self.rawValue, arguments: parameters)
        }
        let urlString = "\(host)\(service)"
        return URL(string: urlString)!
    }
}
