//
//  AlphabeticSearchUIControl.swift
//  vk-client
//
//  Created by Vict on 06.01.2021.
//

import UIKit

class AlphabeticSearchUIControl: UIControl {
    
//    private var buttons: [UIButton] = []
//    private var button: UIButton!
//    private var stackView: UIStackView!
//
//    //var alphabet = ("A"..."Z").map { String($0) }
//    var num = ""
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        setupUI()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//
//        setupUI()
//    }
//
//    private func setupUI() {
//
//        button = UIButton(type: UIButton.ButtonType.system)
//        button.setTitle("A", for: .normal)
//        button.setTitleColor(.lightGray, for: .normal)
//        button.setTitleColor(.white, for: .selected)
//        button.addTarget(self, action: #selector(selectLetter), for: .touchUpInside)
//        button.backgroundColor = .red
//        //buttons.append(button)
//
//
//        stackView = UIStackView(arrangedSubviews: [button])
//        addSubview(stackView)
//
//        stackView.axis = .vertical
//        stackView.spacing = 8
//        stackView.alignment = .trailing
//        stackView.distribution = .fillEqually
//    }
//
//    @objc func selectLetter(_ sender: UIButton) {
//        print(#function)
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        stackView.frame = CGRect(x: frame.width - 25, y: frame.height / 4, width: 25, height: frame.height/2)
//    }
    
    
    var letters = [String]()
    var choosedLetter = ""
    private var letterButtons = [UIButton]()
    private var stackView = UIStackView()
    
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
        stackView.spacing = 1
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
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
