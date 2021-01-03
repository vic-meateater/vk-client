//
//  ProfileNavigationViewController.swift
//  vk-client
//
//  Created by Vict on 03.01.2021.
//

import UIKit

class ProfileNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
    }
}
