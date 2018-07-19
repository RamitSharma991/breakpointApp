//
//  GroupsVC.swift
//  breakPoint
//
//  Created by Ramit sharma on 09/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    @IBOutlet weak var groupTableViewOutlet: UITableView!
    
    var groupsArray = [Group]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTableViewOutlet.delegate = self
        groupTableViewOutlet.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.groupTableViewOutlet.reloadData()
            }
        }
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = groupTableViewOutlet.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? groupCell else { return UITableViewCell() }
        let group = groupsArray[indexPath.row]
        cell.configureCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memberCount)
//   ststic-code
//cell.configureCell(title: "Nerd Herd", description: "As Nerdy as they come", memberCount: 3)
        return cell
    }
}
