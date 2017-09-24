//
//  FIrebaseUserCreator.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Firebase
import  SwiftKeychainWrapper

struct FirebaseUserCreator: UserCreator {
    var navigationController: UINavigationController?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func createUserWithEmailAndPassword(_ email: String, _ password: String, _ userData: Dictionary<String, Any>) {
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print("JOSE: There was an error while creating a user with email and password \(error)")
            } else {
                print("JOSE: User created successfully with email and password")
                if let user = user {
                    DataService.ds.createFirebaseUser(uid: user.uid, userData: userData)
                    self.storeUidInKeychain(uid: user.uid)
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            }
        }
    }
    
    func storeUidInKeychain(uid: String){
        let saveSuccessful: Bool = KeychainWrapper.standard.set(uid, forKey: KEY_UID)
        print("JOSE: Saved key to KeychainWrapper: \(saveSuccessful)")
    }
}
