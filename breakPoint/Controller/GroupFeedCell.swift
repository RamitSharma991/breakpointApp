//
//  GroupFeedCell.swift
//  breakPoint
//
//  Created by Ramit sharma on 20/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {
    

    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    
    
    func configureCell(profileImage: UIImage,email: String, content: String) {
        
        self.profileImg.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
