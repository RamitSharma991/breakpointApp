//
//  LoginVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 10/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    //outlets
    @IBOutlet weak var emailFeild: insetTextField!
    @IBOutlet weak var passwordField: insetTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailFeild.delegate = self
        passwordField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        
        if emailFeild.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailFeild.text!, andPassword: passwordField.text!) { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
                else  {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailFeild.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registerationError ) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailFeild.text!, andPassword: self.passwordField.text!, loginComplete: { (success, nil) in
                            self.dismiss(animated: true, completion: nil)
                            print("Successfully registered user")
                        })
                        
                    }  else  {
                        print(String(describing: registerationError?.localizedDescription))
                    }
                    
                })
            }
        }
    }
    
    
    @IBAction func closeBtn(_ sender: Any) {
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
}
