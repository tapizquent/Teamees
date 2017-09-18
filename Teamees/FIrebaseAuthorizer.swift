//
//  Test.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/15/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import FirebaseAuth

class FirebaseeAuthorizer {
//    private var toPrint: String!
//    private var authorizer: Authorizer!
//
//    public init(toPrint: String, authorizer: Authorizer) {
//        self.toPrint = toPrint
//        self.authorizer = authorizer
//    }
//
//    public func printString() {
//        print(self.toPrint)
//    }
    private func authorizeWithEmailAndPass(_ email: String, _ password: String){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("JOSE: There was a problem signing in with email and password\(error)")
            } else {
                print("JOSE: Successfully signed in with email and password")
            }
            
        }
    }
}
