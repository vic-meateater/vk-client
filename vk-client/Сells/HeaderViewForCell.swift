//
//  HeaderViewForCell.swift
//  vk-client
//
//  Created by Vict on 16.01.2021.
//

import UIKit

class HeaderViewForCell: UITableViewHeaderFooterView {

    static let identifier = "headerViewCell"
    private let color = UIColor.init(ciColor: .red)
    
    func configure() {
        self.tintColor = color
        textLabel!.backgroundColor = color
        //textLabel!.text = text
    }

}
