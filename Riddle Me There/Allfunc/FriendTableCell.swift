//
//  FriendTableCell.swift
//  Riddle Me There
//
//  Created by admin on 2017/10/23.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class FriendTableCell: UITableViewCell {

    @IBOutlet weak var friendname: UILabel!
    @IBOutlet weak var iconimg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.Autolayout()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func Autolayout() {
        let width = self.frame.size.width
        self.friendname.translatesAutoresizingMaskIntoConstraints = false
        self.iconimg.translatesAutoresizingMaskIntoConstraints = false
        self.friendname.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: width * 0.1).isActive = true
        self.iconimg.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: width * -0.1).isActive = true
    }
}
