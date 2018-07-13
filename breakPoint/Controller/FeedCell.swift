//
//  FeedCell.swift
//  breakPoint
//
//  Created by Ramit sharma on 13/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!

    func configureCell(profileImage: UIImage, email: String, content: String) {
        
        self.proImg.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
        
    }
}
