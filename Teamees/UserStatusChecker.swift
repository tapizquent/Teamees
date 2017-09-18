//
//  UserStatusChecker.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

protocol UserStatusChecker {
    func isUserAuthenticated() -> Bool
    func getCurrentUserUid() -> String
}
