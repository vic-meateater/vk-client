//
//  LaunchScreenViewController.swift
//  vk-client
//
//  Created by Vict on 21.01.2021.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    @IBOutlet weak var firstCircle: CustomAvatarImageView!
    @IBOutlet weak var secondCircle: CustomAvatarImageView!
    @IBOutlet weak var thirdCircle: CustomAvatarImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animate(withDuration: 1, delay: 0, animations: {self.firstCircle.backgroundColor = UIColor.gray})
        UIView.animate(withDuration: 1, delay: 1, animations: {self.secondCircle.backgroundColor = UIColor.gray})
        UIView.animate(withDuration: 1, delay: 2, animations: {self.thirdCircle.backgroundColor = UIColor.gray})
        UIView.animate(withDuration: 1, delay: 3, animations: {self.firstCircle.backgroundColor = UIColor.lightGray},
        //UIView.animate(withDuration: 1.5, delay: 4, animations: {self.secondCircle.backgroundColor = UIColor.lightGray},
                       completion: {success in self.performSegue(withIdentifier: "toTabBarVC", sender: self)})
    }
}
