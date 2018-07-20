//
//  groupFeedVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 20/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class groupFeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendButtonVIew: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    
    @IBOutlet weak var messageTextField: insetTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButtonVIew.bindToKeyboard()

    }

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func sendBtnPressed(_ sender: Any) {
    }
}
