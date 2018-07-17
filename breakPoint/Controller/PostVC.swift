//
//  PostVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 13/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit
import Firebase


class PostVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var sendOutlet: UIButton!
    @IBOutlet weak var textViewlLbl: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewlLbl.delegate = self
        sendOutlet.bindToKeyboard()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    
    @IBAction func sendBtn(_ sender: Any) {
        if textViewlLbl.text != nil && textViewlLbl.text != "type your thing here ...." {
            sendOutlet.isEnabled = false
            
            DataService.instance.uploadPost(withMessage: textViewlLbl.text, forID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    self.sendOutlet.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendOutlet.isEnabled = true
                    print("there was an error!")
                }
            }
        }
    }
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension PostVC: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textViewlLbl.text = ""
    }
    
}

