//
//  RoundedAvatar.swift
//  vk-client
//
//  Created by Vic on 21.01.2021.
//

import UIKit

class RoundedAvatar: UIView {

    var image: UIImage? {
        didSet {
            updateImageView()
        }
    }
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.5).cgColor
        imageView.layer.borderWidth = 0.5
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(frame: CGRect, image: UIImage) {
        self.image = image
        super.init(frame: frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
    }
    
    private func configureImageView() {
        backgroundColor = .clear
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(actionImageViewTapped))
        imageView.addGestureRecognizer(tapGesture)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        
        layer.shadowColor = UIColor.green.withAlphaComponent(0.7).cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 3.0
    }
    
    private func updateImageView() {
        imageView.image = image
        setNeedsDisplay()
    }
    
    // MARK: - Actions
    @objc private func actionImageViewTapped() {
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0,
                       options: [.autoreverse],
                       animations: {
                        self.imageView.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        }, completion: { finished in
            self.imageView.transform = .identity
        })
        
    }
}

