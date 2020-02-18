//
//  Persistable.swift
//  empresas-ioasys
//
//  Created by Thalles Araújo on 17/02/20.
//  Copyright © 2020 Thalles Araújo. All rights reserved.
//

import Foundation
protocol Persistable{
    
    var type: NSObject.Type {get set}
}

extension Persistable {
    
    func defaultEncoding(encoder: NSCoder){
        let mirror = Mirror(reflecting: type)
        
        print("Mapping to persist:")
        for children in mirror.children{
            print("\(children.label)  = \(children.value)")
            encoder.encode(children.value, forKey: children.label!)
            
        }
    }
    
    func defaultDecoder(decoder: NSCoder){
        let mirror = Mirror(reflecting: type)
        for children in mirror.children{
            if Swift.type(of: children.value) == Int.self{
                decoder.decodeInteger(forKey: children.label!)
            }else if Swift.type(of: children.value) == Bool.self{
                decoder.decodeBool(forKey: children.label!)
            }else{
                decoder.decodeObject(forKey: children.label!) as? String
            }
        }
    }
    
}
