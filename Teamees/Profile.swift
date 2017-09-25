//
//  Profile.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/25/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import Foundation

class Profile {
    
    var fullName: String
    var email: String
    var profileAttributes = [Attribute]()
    
    var likedEvents = [Event]()
    var ownedEvents = [Event]()
    
    public required init(data: DataService){
        if let info = data.retrieveData(fromDatabasePath: "") {
            self.fullName = "" // Gotta find out how to do this here
            self.email = ""
        }
    }
}
