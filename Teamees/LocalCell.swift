//
//  LocalCell.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit

class LocalCell: TopCell {
    override func fetchEvents() {
        self.events = [Event]()
        let event = Event()
        event.title = "Different Post in Liked Section"
        event.description = "This is where the liked description will be"
        event.thumbnailImageName = "red_roses"
        event.likes = 33
        events?.append(event)
    }
}
