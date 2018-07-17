//
//  MeVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 11/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var emailOutlet: UILabel!
    @IBOutlet weak var tableviewOutlet: UITableView!
    @IBOutlet weak var logOutOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailOutlet.text = Auth.auth().currentUser?.email
    }
    
    
    @IBAction func signOutBtn(_ sender: Any) {
        
        let logooutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do{
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(withIdentifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            }
            catch{
                print(error)
            }
        }
        logooutPopup.addAction(logoutAction)
        present(logooutPopup, animated: true, completion: nil)
    }
    
}
