//
//  groupCell.swift
//  breakPoint
//
//  Created by Ramit sharma on 19/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class groupCell: UITableViewCell {

//Outlets
    @IBOutlet weak var groupTitlLbl: UILabel!
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    @IBOutlet weak var membersCountLbl: UILabel!
    
    
    
    func configureCell(title: String, description: String, memberCount: Int) {
        self.groupTitlLbl.text = title
        self.groupDescriptionLbl.text = description
        self.membersCountLbl.text = "\(memberCount) members"
    }

}
