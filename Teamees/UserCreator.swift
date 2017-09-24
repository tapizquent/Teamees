//
//  UserCreator.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/18/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//
import UIKit

protocol UserCreator {
    //User creator needs a Navigation controller to be able to push and pop to correct view controller
    init(navigationController: UINavigationController)
    func createUserWithEmailAndPassword(_ email: String, _ password: String, _ userData: Dictionary<String, Any>)
}
