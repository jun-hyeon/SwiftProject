//
//  CarTableViewCell.swift
//  TableViewStoryboardEx
//
//  Created by 최준현 on 11/16/23.
//

import UIKit

class CarTableViewCell: UITableViewCell {

    @IBOutlet var carLabel: UILabel!
    @IBOutlet var carImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
