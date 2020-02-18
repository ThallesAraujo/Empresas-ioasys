//
//  ExampleService.swift
//  swift-issues
//
//  Created by Thalles Araújo on 15/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class EnterpriseService{
    
    class func getEnterprises(success: @escaping (_ enterprises: [Enterprise]) -> Void, failure: @escaping (_ error: String) -> Void){
        
        Network.request(url: APIHelper.ENTERPRISES.getURL(), method: .get, completion: { (response) in
            StatusCodeHelper.handleResponse(response: response, success: {
                guard let json = response.result.value as? [String:Any], let list = json["enterprises"] as? [[String:Any]] else{
                    failure("JSON Inválido")
                    return
                }
                let enterprises = Mapper<Enterprise>().mapArray(JSONArray: list)
                success(enterprises)
            }, error: {error in
                failure(error)
            })
            
        }, failure: {error in
            failure(error)
        }, noNetworkCompletion: failure)
    }
    
}
