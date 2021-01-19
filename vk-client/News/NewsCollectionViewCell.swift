//
//  NewsCollectionViewCell.swift
//  vk-client
//
//  Created by Vict on 18.01.2021.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    //@IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let nib = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
    static let identifier = "cellNews"
    
    func config(newsText: String){
        newsTextView.text = newsText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
