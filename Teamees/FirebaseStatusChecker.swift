//
//  FirebaseStatusChecker.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Firebase
import SwiftKeychainWrapper

class FirebaseStatusChecker: UserStatusChecker {
    
    func didUserChangeStatus() -> Bool {
        var authToken: Bool = false
            Auth.auth().addStateDidChangeListener { auth, user in
                if user != nil {
                    authToken = true
                    print("JOSE: User is logged in")
                } else {
                   authToken = false
                    print("JOSE: User is NOT logged in")
                }
            }
            return authToken
    }
    
    func isUserAuthenticated() -> Bool{
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID){
            return true
        } else {
            return false
        }

    }
    
    func getCurrentUserUid() -> String{
        if let currentUser = Auth.auth().currentUser?.uid{
            return currentUser
        } else {
            let errorMessage = "Error retrieving current user"
            return errorMessage
        }
    }
    
}
