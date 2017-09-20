//
//  UserCreator.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

protocol UserCreator {
    func createUserWithEmailAndPassword(_ email: String, _ password: String, _ userData: Dictionary<String, Any>)
}
