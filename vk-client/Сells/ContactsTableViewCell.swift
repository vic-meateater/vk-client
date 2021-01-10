//
//  ContactsTableViewCell.swift
//  vk-client
//
//  Created by Vict on 07.01.2021.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    
    @IBOutlet weak var contactName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
