//
//  ContactsTableViewCell.swift
//  vk-client
//
//  Created by Vic on 07.01.2021.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(friendValues: friend){
        self.contactName.text = friendValues.name
        self.contactImageView.image = UIImage(named: friendValues.avatar)
    }

}
