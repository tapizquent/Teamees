//
//  Test.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/15/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Firebase
import SwiftKeychainWrapper


class FirebaseAuthenticator: Authenticator {

    var navigation: UINavigationController?
    required init(_ navigationController: UINavigationController){
        self.navigation = navigationController
    }
    
    func signOutUser() -> Bool{
        do {
            try Auth.auth().signOut()
            print("JOSE: Successfully signed out")
            self.removeUidInKeychain(uid: KEY_UID)
            return true
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
            return false
        }
        
    }
    
    
    func authenticateWithAccessToken(_ token: String) {
        Auth.auth().signIn(withCustomToken: token) { (user, error) in
            if let error = error {
                print("JOSE: There was an error signing in with token: \(error)")
            } else {
                print("JOSE: Successfully signed in with token")
                if let user = user {
                    let name: String = user.displayName!
                    let userData = ["name": name]
                    DataService.ds.createFirebaseUser(uid: user.uid, userData: userData)
                    self.completeSignIn(uid: user.uid)
                }
            }
        }
    }
    
    // Credentials are usually given by third party apps such as Facebook or Google sign in
    func authorizerWithCredential(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                print("JOSE: Error while signing in with credential \(error)")
            } else {
                print("JOSE: Successfully signed in with credential")
                if let user = user {
                    let name: String = user.displayName!
                    let userData = ["name": name]
                    DataService.ds.createFirebaseUser(uid: user.uid, userData: userData)
                    self.completeSignIn(uid: user.uid)
                }
            }
        }
    }
    
    func authenticateWithEmailAndPass(_ email: String, _ pass: String) {
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if let error = error {
                print("JOSE: Error while signing in with email and password \(error)")
            } else {
                print("JOSE: Successfully signed in with email and password")
                if let user = user {
                    let name: String = user.displayName!
                    let userData = ["name": name]
                    DataService.ds.createFirebaseUser(uid: user.uid, userData: userData)
                    self.completeSignIn(uid: user.uid)
                }
            }
        }
    }
    
    func completeSignIn(uid: String){
        self.storeUidInKeychain(uid: uid)
        self.navigation?.popViewController(animated: true)
    }
    
    func storeUidInKeychain(uid: String){
        let saveSuccessful: Bool = KeychainWrapper.standard.set(uid, forKey: KEY_UID)
        print("JOSE: Saved key to KeychainWrapper: \(saveSuccessful)")
    }
    
    func removeUidInKeychain(uid: String) {
        let removeSuccessful: Bool = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("JOSE: Uid removed from keychaing: \(removeSuccessful)")
    }
    
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
}
