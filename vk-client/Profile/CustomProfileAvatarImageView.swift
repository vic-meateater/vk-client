//
//  CustomProfileAvatarImageView.swift
//  vk-client
//
//  Created by Vict on 03.01.2021.
//

import UIKit

class CustomProfileAvatarImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2

    }

}

class ProfileAvatarImageShadow: UIImageView{
    override func layoutSubviews() {
        super.layoutSubviews()
     
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
        layer.cornerRadius = frame.height / 2
    }
}
