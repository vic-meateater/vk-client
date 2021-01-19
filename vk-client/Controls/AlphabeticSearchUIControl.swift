//
//  AlphabeticSearchUIControl.swift
//  vk-client
//
//  Created by Vict on 06.01.2021.
//

import UIKit

class AlphabeticSearchUIControl: UIControl {

    var letters = [String]()
    
    private var letterButtons = [UIButton]()
    private var stackView = UIStackView()
    
    var choosedLetter: String? = nil {
        didSet{
            sendActions(for: .valueChanged)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        letterButtons.removeAll()
        for letter in letters {
            let button = UIButton(type: .system)
            button.setTitle(letter, for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectLetter(_:)), for: .touchUpInside)
            letterButtons.append(button)
        }
        
        stackView.removeFromSuperview()
        stackView = UIStackView(arrangedSubviews: letterButtons)
        
        self.addSubview(stackView)
        stackView.spacing = 0.2
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func selectLetter(_ sender: UIButton) {
        if let index = letterButtons.firstIndex(of: sender){
            choosedLetter = letters[index]
            sendActions(for: .valueChanged)
        }
    }
    

}
