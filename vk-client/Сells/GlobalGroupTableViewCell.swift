//
//  GlobalGroupTableViewCell.swift
//  vk-client
//
//  Created by Vic on 29.12.2020.
//

import UIKit

class GlobalGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var globalGroupImage: UIImageView!
    @IBOutlet weak var globalGroupLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
