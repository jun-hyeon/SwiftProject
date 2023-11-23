//
//  MemberTableViewCell.swift
//  UIKitDemoApp
//
//  Created by 최준현 on 11/23/23.
//

import UIKit

class MemberTableViewCell: UITableViewCell {
    
    
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
