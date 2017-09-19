//
//  Authorizer.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Firebase

protocol Authenticator {
    init(_ navigationController: UINavigationController)
    func authenticateWithEmailAndPass(_ email: String, _ pass: String)
    func authenticateWithAccessToken(_ token: String)
    func authorizerWithCredential(_ credential: AuthCredential)
    func signOutUser() -> Bool
}
