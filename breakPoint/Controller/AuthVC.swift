//
//  AuthVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 10/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func emailLogin(_ sender: Any) {
        
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    @IBAction func googleLogin(_ sender: Any) {
    }
    @IBAction func fbLogin(_ sender: Any) {
    }
    
}
