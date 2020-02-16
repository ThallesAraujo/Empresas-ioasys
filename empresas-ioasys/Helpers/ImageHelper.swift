//
//  ImageHelper.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 16/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
class ImageHelper{
    
    static func getImage(_ path: String) -> String{
        if path != ""{
            var api_url = ConfigScheme.valueForKey("API_URL")
            api_url.removeLast()
            return api_url + path
        }else{
            return ""
        }
    }
    
}
