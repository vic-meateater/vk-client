//
//  FriendsDataSource.swift
//  vk-client
//
//  Created by Vic on 11.01.2021.
//

import UIKit

class FriendsDataSource {
    func getFriends() -> [friend]{
    return [
        friend(name: "Саша", avatar: "neo", images: ["neo_1", "neo_2", "neo_3"]),
        friend(name: "Василиса", avatar: "trin", images: ["trin_1", "trin_2", "trin_3"]),
        friend(name: "Петя", avatar: "morpheus", images: ["morpheus_1", "morpheus_2"]),
        friend(name: "Иван", avatar: "noavatar"),
        friend(name: "Игорь", avatar: "noavatar"),
        friend(name: "Smith", avatar: "smith_avatar", images: ["smith_1"]),
        friend(name: "Яхон", avatar: "noavatar"),
        friend(name: "Нори", avatar: "noavatar"),
        friend(name: "Жмых", avatar: "noavatar"),
    ]
    }
}
