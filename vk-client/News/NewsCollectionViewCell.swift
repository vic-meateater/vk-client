//
//  NewsCollectionViewCell.swift
//  vk-client
//
//  Created by Vict on 18.01.2021.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var newsMainImage: UIImageView!
    //@IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var newsAvatarImageView: UIImageView!
    @IBOutlet weak var newsNameLabel: UILabel!
    
    static let nib = UINib(nibName: "NewsCollectionViewCell", bundle: nil)
    static let identifier = "cellNews"
    
    func config(newsText: String){
        newsTextView.text = newsText
    }
    
    func set(newsValues: news){
        newsNameLabel.text = newsValues.name
        newsAvatarImageView.image = UIImage(named: newsValues.avatar ?? "no_avatar")
        newsMainImage.image = UIImage(named: newsValues.newsImage ?? "no_image")
        newsTextView.text = newsValues.newsText
        asdf(textView: newsTextView)
    }
    
    func asdf(textView: UITextView){
        textView.translatesAutoresizingMaskIntoConstraints = true
        textView.isScrollEnabled = false
        textView.sizeToFit()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
