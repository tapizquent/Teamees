//
//  ProfileVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/15/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class ProfileVC: UIViewController {
    
    // profileVC = ProfileVC()
    var userAuthenticator: Authenticator? = nil
    let userStatusChecker: UserStatusChecker? = FirebaseStatusChecker()
    //let mainVC = MainVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userAuthenticator = FirebaseAuthenticator(navigationController!)
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.tintColor = .white
        setUpButton()
    }
    let signOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        //button.addTarget(self, action: #selector(signOutUser(_:)), for: .touchUpInside)
        button.backgroundColor = UIColor.lightGray
        return button
    }()
    
    func setUpButton(){
        
        view.backgroundColor = MAIN_BACKGROUND_COLOR
        view.addSubview(signOutButton)
        view.addContraintsWithFormat(format: "V:[v0(40)]", views: signOutButton)
        view.addContraintsWithFormat(format: "H:|[v0]|", views: signOutButton)
        view.addConstraint(NSLayoutConstraint(item: signOutButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: signOutButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        signOutButton.addTarget(self, action: #selector(self.signOutUser), for: .touchUpInside)
        
    }
    
    
    @objc func signOutUser(){
        print("SignOutPressed")
        if userAuthenticator?.signOutUser() == true {
            navigationController?.popViewController(animated: true)
        }
        
        
    }
}
