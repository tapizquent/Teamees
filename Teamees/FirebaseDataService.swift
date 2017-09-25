//
//  DataService.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import FirebaseDatabase

let DB_BASE = Database.database().reference()

class FirebaseDataService: DataService {
    func retrieveData(fromDatabasePath databasePath: Any) -> Data {
        let data = Data()
        return data
    }
    
    func writeData(toDatabasePath databasePath: Any, withData: Data) {
        
    }
    
    func updateData(_ databasePath: Any) -> Bool {
        let userUpdatedData: Bool = false
        return userUpdatedData
    }
    
    
    static let ds = FirebaseDataService()
    
    private var _REF_USERS = DB_BASE.child("users")
    private var _REF_POSTS = DB_BASE.child("posts")
    
    var REF_POSTS: DatabaseReference {
        return _REF_POSTS
    }
    var REF_USERS: DatabaseReference {
        return _REF_USERS
    }
    
    
    func createFirebaseUser(uid: String, userData: Dictionary<String, Any>){
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
    
}
