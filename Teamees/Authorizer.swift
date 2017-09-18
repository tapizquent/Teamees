//
//  Authorizer.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

protocol Authorizer {
    func authenticateWithEmailAndPass(_ email: String, _ pass: String)
    func authenticateWithAccessToken(_ token: String)
}
