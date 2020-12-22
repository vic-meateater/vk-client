//
//  ViewController.swift
//  vk-client
//
//  Created by Vict on 21.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let tapToHide = UITapGestureRecognizer(target: self, action: #selector(tapToHideKeyboard))
        scrollView.addGestureRecognizer(tapToHide)
    }
    
    @objc func tapToHideKeyboard(){
        self.view.endEditing(true)
    }

}

