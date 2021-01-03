//
//  NavViewController.swift
//  vk-client
//
//  Created by Vict on 25.12.2020.
//

import UIKit

class FriendsNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarItem = UITabBarItem(title: "Друзья", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {

    }
    

}
