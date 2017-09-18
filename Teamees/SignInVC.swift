//
//  SignInVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Hero
import Firebase

class SignInVC: UIViewController {
    
   // let FIRAuthorizer = FirebaseAuthorizer()
    var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        isHeroEnabled = true
        //view.heroID = "toLogIn"
        
        setUpSignInForm()
        
    }
    
    let formView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.heroID = "toLogIn"
        view.heroModifiers = [.fade]
        return view
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        //button.tintColor = .red
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email address"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    @objc func cancelButtonTapped(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func signInButtonPressed(){
        if let email = emailTextField.text {
            if let pass = passwordTextField.text {
                //FIRAuthorizer.authenticateWithEmailAndPass(email, pass)
            }
        }
    }
    
    func setUpSignInForm(){
        
        view.addSubview(formView)
        view.addSubview(cancelButton)
        view.addContraintsWithFormat(format: "H:|-30-[v0]-30-|", views: formView)
        view.addContraintsWithFormat(format: "V:[v0(250)]", views: formView)
        view.addConstraint(NSLayoutConstraint(item: formView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        view.addContraintsWithFormat(format: "H:|-8-[v0(80)]", views: cancelButton)
        view.addContraintsWithFormat(format: "V:|-60-[v0(20)]", views: cancelButton)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        formView.addSubview(emailTextField)
        formView.addSubview(passwordTextField)
        formView.addSubview(signInButton)
        //Contraints for Email and Password Text Fields
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: emailTextField)
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: passwordTextField)
                formView.addContraintsWithFormat(format: "V:|-30-[v0(40)]-30-[v1(40)]", views: emailTextField, passwordTextField)
        //Contraints for Sign In Button
        formView.addContraintsWithFormat(format: "H:[v0(100)]", views: signInButton)
        formView.addContraintsWithFormat(format: "V:[v0(40)]-30-|", views: signInButton)
        formView.addConstraint(NSLayoutConstraint(item: signInButton, attribute: .centerX, relatedBy: .equal, toItem: formView, attribute: .centerX, multiplier: 1, constant: 0))
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)

        
        
    }

}
