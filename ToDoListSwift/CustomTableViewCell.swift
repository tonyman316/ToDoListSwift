//
//  CustomTableViewCell.swift
//  ToDoListSwift
//
//  Created by Tony's Mac on 11/12/14.
//  Copyright (c) 2014 DeAnza. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var customImageView: UIImageView!
    @IBOutlet var customTitleLabel: UILabel!
    @IBOutlet var customSubtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

