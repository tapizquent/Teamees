//
//  SignInVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper
import FBSDKCoreKit
import FBSDKLoginKit
import ChameleonFramework

class SignInVC: UIViewController {
    var userAuthenticator: Authenticator?
    let userCreator: UserCreator? = FirebaseUserCreator()
    let userStatusChecker: UserStatusChecker? = FirebaseStatusChecker()
    
    var active: Bool?
    //var mainVC = MainVC()

    //var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAuthenticator = FirebaseAuthenticator(navigationController!)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        //view.heroID = "toLogIn"
        navigationController?.navigationBar.tintColor = .white
        setUpSignInForm()
    }
    override func viewWillDisappear(_ animated: Bool) {
        if userStatusChecker?.isUserAuthenticated() == true {
            navigationController?.popViewController(animated: true)
        }
    }
    
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "blurLogIn")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let logoLabel: UILabel = {
        let label = UILabel()
        label.text = "Teamees"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 44)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let formView: UIView = {
        let view = UIView()
        return view
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView()
        let leftImage = UIImage(named: "account_icon")
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.image = leftImage
        textField.font = UIFont(name: "HelveticaNeue", size: 18)
        textField.attributedPlaceholder = NSAttributedString(string: "Email address", attributes: [.foregroundColor: UIColor(red:60/255, green:60/255, blue:60/255, alpha:1.0)])
        textField.textColor = .white
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.keyboardAppearance = .dark
        textField.textAlignment = .center
        textField.leftView = imageView
        textField.leftViewMode = .always
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView()
        let leftImage = UIImage(named: "lock_icon")
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.image = leftImage
        textField.font = UIFont(name: "HelveticaNeue", size: 18)
        textField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor(red:60/255, green:60/255, blue:60/255, alpha:1.0)])
        textField.textColor = .white
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.keyboardAppearance = .dark
        textField.textAlignment = .center
        textField.isSecureTextEntry = true
        textField.leftView = imageView
        textField.leftViewMode = .always
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        button.backgroundColor = UIColor(complementaryFlatColorOf: MAIN_BACKGROUND_COLOR)
        button.setTitleColor(ContrastColorOf(backgroundColor: button.backgroundColor!, returnFlat: true), for: .normal)
        button.layer.cornerRadius = 25.0
        return button
    }()
    
    let facebookButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "facebookLogo"), for: .normal)
        return button
    }()
    
    let emailBottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.flatBlackColorDark()
        view.alpha = 1
        return view
    }()
    let passwordBottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.flatBlackColorDark()
        view.alpha = 1
        return view
    }()
    
    @objc func signInButtonPressed(){
        print("SignIn Button pressed")
        if let email = emailTextField.text {
            if let password = passwordTextField.text {
                userAuthenticator?.authenticateWithEmailAndPass(email, password)
                dismissKeyboard()
            }
        }
    }
    
    func setUpSignInForm(){
        
        view.backgroundColor = MAIN_BACKGROUND_COLOR
        view.addSubview(formView)
        view.addContraintsWithFormat(format: "H:|-30-[v0]-30-|", views: formView)
        view.addContraintsWithFormat(format: "V:|[v0]|", views: formView)
//        view.addConstraint(NSLayoutConstraint(item: formView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))

        formView.addSubview(logoLabel)
        formView.addSubview(emailTextField)
        formView.addSubview(emailBottomLine)
        formView.addSubview(passwordTextField)
        formView.addSubview(passwordBottomLine)
        formView.addSubview(signInButton)
        formView.addSubview(facebookButton)
        
        //Contraints for Email and Password Text Fields
        formView.addContraintsWithFormat(format: "H:|-30-[v0]-30-|", views: logoLabel)
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: emailTextField)
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: passwordTextField)
        formView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: emailBottomLine)
        formView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: passwordBottomLine)
        formView.addContraintsWithFormat(format: "V:|-60-[v0]-60-[v1(50)]-(-4)-[v2(1)]-30-[v3(50)]-(-4)-[v4(1)]-50-[v5(50)]-30-[v6(40)]", views: logoLabel ,emailTextField, emailBottomLine, passwordTextField, passwordBottomLine, signInButton, facebookButton)
        
        //Contraints for Sign In Button
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: signInButton)
        formView.addConstraint(NSLayoutConstraint(item: signInButton, attribute: .centerX, relatedBy: .equal, toItem: formView, attribute: .centerX, multiplier: 1, constant: 0))
        formView.addConstraint(NSLayoutConstraint(item: facebookButton, attribute: .centerX, relatedBy: .equal, toItem: formView, attribute: .centerX, multiplier: 1, constant: 0))
        formView.addContraintsWithFormat(format: "H:[v0(40)]", views: facebookButton)
        
        
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        facebookButton.addTarget(self, action: #selector(facebookButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @objc func facebookButtonPressed(){
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("NOTE(ERROR): Unable to authenticate with facebook - \(String(describing: error))")
            } else if result?.isCancelled == true {
                print("NOTE(ERROR): User cancelled FaceBook log in - \(String(describing: error))")
            } else {
                print("NOTE: Successfully Authenticated with Facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.userAuthenticator?.authorizerWithCredential(credential)
            }
        }
    }

}
