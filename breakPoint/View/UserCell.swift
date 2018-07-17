//
//  UserCell.swift
//  breakPoint
//
//  Created by Ramit sharma on 17/07/18.
//  Copyright © 2018 Ramit sharma. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    //outlets
    @IBOutlet weak var checkimgLbl: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var profileImgLbl: UIImageView!
    
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImgLbl.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkimgLbl.isHidden = false
        }
        else {
            self.checkimgLbl.isHidden = true
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
