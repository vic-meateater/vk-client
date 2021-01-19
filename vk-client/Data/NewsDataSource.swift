//
//  NewsDataSource.swift
//  vk-client
//
//  Created by Vict on 19.01.2021.
//

import UIKit


class NewsDataSource {
    var users: [user]!
    func getNews(users: user) -> [news] {
        return [news(name: users.name, avatar: users.avatar, newsImage: UIImage(named: "no_image"), newsText: "asdf")]
    }
}
