//
//  Liker.swift
//  vk-client
//
//  Created by Vic on 04.01.2021.
//

import UIKit

class LikerUIControl: UIControl {

    private var likeButton: UIButton!
    
    var liked: Bool = false {
            didSet {
                sendActions(for: .valueChanged)
            }
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
        setupUI()
    }


    private func setupUI() {
        likeButton = UIButton(type: UIButton.ButtonType.system)
        likeButton.tintColor = .red
        likeButton.setBackgroundImage(UIImage(systemName: "suit.heart"), for: .normal)
        likeButton.addTarget(self, action: #selector(checkLike), for: .touchUpInside)
        addSubview(likeButton)
     
    }
    
    @objc func checkLike(){
        if likeButton.backgroundImage(for: .normal) == UIImage(systemName: "suit.heart") {
            likeButton.tintColor = .red
            likeButton.setBackgroundImage(UIImage(systemName: "suit.heart.fill"), for: .normal)
            liked = true
        }else{
            likeButton.tintColor = .red
            likeButton.setBackgroundImage(UIImage(systemName: "suit.heart"), for: .normal)
            liked = false
        }
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [.autoreverse],
                       animations: {
                        self.likeButton.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }, completion: { finished in
            self.likeButton.transform = .identity
        })
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        likeButton.frame = bounds
    }

}

