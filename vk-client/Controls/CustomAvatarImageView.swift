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
    
    @IBInspectable var color: UIColor = .black {
        didSet {
            layer.shadowColor = color.cgColor
        }
    }
    
    @IBInspectable var radius: CGFloat = 5 {
        didSet {
            layer.shadowRadius = radius
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.8
        layer.masksToBounds = false
        layer.cornerRadius = frame.height / 2
    }
}
