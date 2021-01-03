//
//  FriendsTableViewController.swift
//  vk-client
//
//  Created by Vict on 26.12.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends: [friend]!
    
    var friendImage: UIImage!
    var nameFriend: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        friends = [
            friend(name: "Саша", avatar: "neo"),
            friend(name: "Василиса", avatar: "trin"),
            friend(name: "Петя", avatar: "morpheus"),
            friend(name: "Иван", avatar: "noavatar"),
        ]
        
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendsTableViewCell{
            //cell.FriendLabel.text = Array(friends.keys.sorted())[indexPath.row]
            let sortedFrends = friends.sorted { $0.name < $1.name }
            cell.friendLabel.text = sortedFrends[indexPath.row].name
            cell.friendAvatar.image = UIImage(named: sortedFrends[indexPath.row].avatar)
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let sortedFrends = friends.sorted { $0.name < $1.name }
            nameFriend = sortedFrends[indexPath.row].avatar
            performSegue(withIdentifier: "toFriendFullImageVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "toFriendFullImageVC":
            if let destination = segue.destination as? FriendCollectionViewController{
                destination.friendImages = nameFriend
            }
        default:
            break
        }
    }
    



}
