//
//  FirebaseStatusChecker.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Firebase

class FirebaseStatusChecker: UserStatusChecker {
    
    func isUserAuthenticated() -> Bool{
        if Auth.auth().currentUser != nil {
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
