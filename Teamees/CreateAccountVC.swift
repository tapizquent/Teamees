//
//  CreateAccountVC.swift
//  Teamees
//
//  Created by Jose Tapizquent on 9/14/17.
//  Copyright © 2017 Jose Tapizquent. All rights reserved.
//

import UIKit
import ChameleonFramework

class CreateAccountVC: UIViewController {
    
    var userCreator: UserCreator?
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Account"
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let formView: UIView = {
        let view = UIView()
        return view
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView()
        let leftImage = UIImage(named: "account_icon")
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.image = leftImage
        textField.font = UIFont(name: "HelveticaNeue", size: 18)
        textField.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [.foregroundColor: UIColor(red:60/255, green:60/255, blue:60/255, alpha:1.0)])
        textField.textColor = .white
        textField.borderStyle = .none
        textField.autocapitalizationType = .none
        textField.keyboardAppearance = .dark
        textField.textAlignment = .center
        textField.leftView = imageView
        textField.leftViewMode = .always
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView()
        let leftImage = UIImage(named: "email_icon")
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
        textField.clearsOnInsertion = true
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView()
        let leftImage = UIImage(named: "lock_outline_icon")
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
    
    let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        let imageView = UIImageView()
        let leftImage = UIImage(named: "lock_icon")
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.image = leftImage
        textField.font = UIFont(name: "HelveticaNeue", size: 18)
        textField.attributedPlaceholder = NSAttributedString(string: "Confirm password", attributes: [.foregroundColor: UIColor(red:60/255, green:60/255, blue:60/255, alpha:1.0)])
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
    
    let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        button.backgroundColor = UIColor(complementaryFlatColorOf: MAIN_BACKGROUND_COLOR)
        button.setTitleColor(ContrastColorOf(backgroundColor: button.backgroundColor!, returnFlat: true), for: .normal)
        button.layer.cornerRadius = 25.0
        return button
    }()
    
    let titleBottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.flatBlackColorDark()
        view.alpha = 1
        return view
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
    
    let confirmPasswordBottomLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.flatBlackColorDark()
        view.alpha = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = UINavigationBar.appearance()
        navBar.topItem?.title = "Create account"
        self.title = "Create account"
        view.backgroundColor = MAIN_BACKGROUND_COLOR
        createAcountForm()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAcountForm(){
        
        view.backgroundColor = MAIN_BACKGROUND_COLOR
        view.addSubview(formView)
        view.addContraintsWithFormat(format: "H:|-30-[v0]-30-|", views: formView)
        view.addContraintsWithFormat(format: "V:|[v0]|", views: formView)
        
        //        view.addConstraint(NSLayoutConstraint(item: formView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
        
        formView.addSubview(titleLabel)
        formView.addSubview(nameTextField)
        formView.addSubview(emailTextField)
        formView.addSubview(passwordBottomLine)
        formView.addSubview(emailBottomLine)
        formView.addSubview(passwordTextField)
        formView.addSubview(titleBottomLine)
        formView.addSubview(confirmPasswordTextField)
        formView.addSubview(createAccountButton)
        formView.addSubview(confirmPasswordBottomLine)
        
        //Contraints for Email and Password Text Fields
        formView.addContraintsWithFormat(format: "H:|-30-[v0]-30-|", views: titleLabel)
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: nameTextField)
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: emailTextField)
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: passwordTextField)
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: confirmPasswordTextField)
        formView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: titleBottomLine)
        formView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: passwordBottomLine)
        formView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: emailBottomLine)
        formView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: confirmPasswordBottomLine)
        //formView.addContraintsWithFormat(format: "H:|-8-[v0]-8-|", views: passwordBottomLine)
        formView.addContraintsWithFormat(format: "V:|-60-[v0]-60-[v1(50)]-(-4)-[v2(1)]-30-[v3(50)]-(-4)-[v4(1)]-30-[v5(50)]-(-4)-[v6(1)]-30-[v7(50)]-(-4)-[v8(1)]-50-[v9(50)]", views: titleLabel, nameTextField, titleBottomLine, emailTextField, emailBottomLine, passwordTextField, passwordBottomLine, confirmPasswordTextField, confirmPasswordBottomLine, createAccountButton)
        //Contraints for Sign In Button
        formView.addContraintsWithFormat(format: "H:|-16-[v0]-16-|", views: createAccountButton)
        formView.addConstraint(NSLayoutConstraint(item: createAccountButton, attribute: .centerX, relatedBy: .equal, toItem: formView, attribute: .centerX, multiplier: 1, constant: 0))
        
        createAccountButton.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        
    }
    
    @objc func createAccountButtonPressed(){
        if let name = nameTextField.text, !name.isEmpty {
            if let email = emailTextField.text, !email.isEmpty {
                if isValidEmail(testStr: email) == true {
                    if let password = passwordTextField.text, !password.isEmpty {
                        if let confirmPassword = confirmPasswordTextField.text, !confirmPassword.isEmpty {
                            if confirmPassword == password {
                                //                            self.userCreator = FirebaseUserCreator()
                                //                            let userData = ["name": name]
                                //                            userCreator?.createUserWithEmailAndPassword(email, password, userData)
                                print("JOSE: User with name: \(name) created successfully")
                            } else {
                                print("Password do not match")
                            }
                        } else {
                            placeholderErrorChange(confirmPasswordTextField, "Please confirm password")
                        }
                    } else {
                        placeholderErrorChange(passwordTextField, "Password cannot be empty")
                        //passwordTextField.placeholder = "Password can not be empty"
                    }
                } else {
                    emailTextField.text = "Email is not valid"
                }
            } else {
                placeholderErrorChange(emailTextField, "Email cannot be empty")
            }
        } else {
            placeholderErrorChange(nameTextField, "Name cannot be empty")
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func placeholderErrorChange(_ textField: UITextField, _ text: String){
        textField.attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: UIColor.flatRed()])
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
