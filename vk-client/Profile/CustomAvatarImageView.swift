//
//  CustomProfileAvatarImageView.swift
//  vk-client
//
//  Created by Vic on 03.01.2021.
//

import UIKit

class CustomAvatarImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2

    }

}

class ShadowAvatarImageView: UIImageView{
    
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
        layer.cornerRadius = frame.height / 2
    }

}
