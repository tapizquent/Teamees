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
        event.title = "Okokokoko"
        event.description = "This is where the second description will be"
        event.likes = 233
        events?.append(event)
    }
}
