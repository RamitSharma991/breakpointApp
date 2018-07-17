//
//  CreateGroupsVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 17/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class CreateGroupsVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var titleTextField: insetTextField!
    @IBOutlet weak var descriptionTextField: insetTextField!
    @IBOutlet weak var emailSearchTextField: insetTextField!
    @IBOutlet weak var doneOutlet: UIButton!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func doneBtn(_ sender: Any) {
    }
    @IBOutlet weak var closeBtn: UIButton!
    
}

extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        
        cell.configureCell(profileImage: profileImage!, email: "just@now.com", isSelected: true)
    return cell
    }
    
}
