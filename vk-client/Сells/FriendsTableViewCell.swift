//
//  FriendsTableViewCell.swift
//  vk-client
//
//  Created by Vic on 26.12.2020.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendAvatar: UIImageView!
    @IBOutlet weak var friendLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
