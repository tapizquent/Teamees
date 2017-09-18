//
//  ProfileVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/15/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
   //let firebaseAuth = Auth.auth()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpViews()
    }
    
    func setUpViews(){
        let signOutButton: UIButton = {
            let button = UIButton()
            button.setTitle("Sign Out", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.addTarget(self, action: #selector(signOutUser), for: .touchUpInside)
            return button
        }()
        
        
        view.addSubview(signOutButton)
        view.addContraintsWithFormat(format: "V:[v0(40)]", views: signOutButton)
        view.addContraintsWithFormat(format: "H:|[v0]|", views: signOutButton)
        view.addConstraint(NSLayoutConstraint(item: signOutButton, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint(item: signOutButton, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))
        
    }
    
    @objc func signOutUser(){
        if Auth.auth().currentUser != nil {
            do {
                try Auth.auth().signOut()
                print("JOSE: User successfully signed out")
            } catch let signOutError as NSError {
                print ("JOSE: Error signing out: %@", signOutError)
            }
        }
    }
}
