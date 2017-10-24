//
//  CustomTableCell.swift
//  Riddle Me There
//
//  Created by admin on 2017/8/30.
//  Copyright © 2017年 admin. All rights reserved.
//

import UIKit

class CustomTableCell: UITableViewCell {
    @IBOutlet weak var numberlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var scorelabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.Autolayout()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func Autolayout() {
        let width = self.frame.size.width
        self.numberlabel.translatesAutoresizingMaskIntoConstraints = false
        self.scorelabel.translatesAutoresizingMaskIntoConstraints = false
        self.numberlabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: width * 0.1).isActive = true
        self.scorelabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: width * -0.1).isActive = true
    }
}

