//
//  FIrebaseUserCreator.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Firebase

struct FirebaseUserCreator: UserCreator {
    
    func createUserWithEmailAndPassword(_ email: String, _ password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("JOSE: There was an error while creating a user with email and password \(error)")
            } else {
                print("JOSE: User created successfully with email and password")
            }
        }
    }
    
    
}
