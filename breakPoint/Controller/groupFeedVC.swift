//
//  groupFeedVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 20/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit
import Firebase

class groupFeedVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var membersLbl: UILabel!
    @IBOutlet weak var sendButtonVIew: UIView!
    @IBOutlet weak var sendBtn: UIButton!
    
    var group: Group?
    var groupMessages = [Message]()
    
    
    func initData(forGroup group: Group) {
        self.group = group
    }
    
    @IBOutlet weak var messageTextField: insetTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButtonVIew.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group?.groupTitle
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            self.membersLbl.text = returnedEmails.joined(separator: ", ")
        }
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!) { (returnedGroupMessages) in
            self.groupMessages = returnedGroupMessages
            self.tableView.reloadData()
                if self.groupMessages.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.groupMessages.count - 1, section: 0), at: .none, animated: true)
                }
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {

        dismissDetail()
    }
    
    
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        
        if messageTextField.text != "" {
            
            messageTextField.isEnabled = false
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: messageTextField.text!, forID: (Auth.auth().currentUser?.uid)!, withGroupKey: group?.key, sendComplete:  { (complete) in
                if complete {
                    self.messageTextField.text = ""
                    self.messageTextField.isEnabled = true
                    self.sendBtn.isEnabled = true
                }
            })
            
        }
        
        
    }
}

extension groupFeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for:[indexPath.row]) as? GroupFeedCell else { return UITableViewCell() }
        
        let message = groupMessages[indexPath.row]
        DataService.instance.getUsername(forUID: message.senderId) { (email) in
            cell.configureCell(profileImage: UIImage(named: "defaultProfileImage")!, email: email, content: message.content)
            
        }
        return cell
        
    }
    
    
    
}





