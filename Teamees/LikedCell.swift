//
//  LikedCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Firebase

class LikedCell: TopCell {
    let userStatusChecker: UserStatusChecker? = FirebaseStatusChecker()
    override func fetchEvents() {
        if userStatusChecker?.isUserAuthenticated() == true{
            self.events = [Event]()
            let event = Event()
            event.title = "Different Post in Liked Section"
            event.description = "This is where the liked description will be"
            event.likes = 33
            events?.append(event)
        } else {
            
        }

    }
}
