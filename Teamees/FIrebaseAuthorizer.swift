//
//  Test.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/15/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Firebase

class FirebaseAuthorizer: Authenticator {
    func signOutUser() {
        do {
            try Auth.auth().signOut()
                print("Succesfully signed out")
        } catch {
            print("Print(JOSE: Error trying to sign out user \(error)")
        }
    }
    
    
    func authenticateWithAccessToken(_ token: String) {
        Auth.auth().signIn(withCustomToken: token) { (user, error) in
            if let error = error {
                print("JOSE: There was an error signing in with token: \(error)")
            } else {
                print("JOSE: Successfully signed in with token")
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
            }
        }
    }
    
    func authenticateWithEmailAndPass(_ email: String, _ pass: String) {
        Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
            if let error = error {
                print("JOSE: Error while signing in with email and password \(error)")
            } else {
                print("JOSE: Successfully signed in with email and password")
            }
        }
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
