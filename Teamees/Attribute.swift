//
//  Attribute.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/25/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Foundation

class Attribute {
    var key: String
    var value: String
    
    public required init(_ key: String, value: String){
        self.key = key
        self.value = value
    }
}
