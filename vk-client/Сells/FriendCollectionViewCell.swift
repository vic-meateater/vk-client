//
//  FriendCollectionViewCell.swift
//  vk-client
//
//  Created by Vic on 27.12.2020.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var likesCounter: UILabel!
    @IBOutlet weak var friendFullImage: UIImageView!
    @IBOutlet weak var likeView: LikerUIControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func tapOnLike(_ sender: LikerUIControl) {
        let tappedLike = likeView.liked
        if tappedLike {
            likesCounter.text = "1"
            likesCounter.textColor = .red
        }else{
            likesCounter.textColor = .black
            likesCounter.text = "0"
        }
    }
    
    
    
}
