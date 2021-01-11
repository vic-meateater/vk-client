//
//  FriendsTableViewController.swift
//  vk-client
//
//  Created by Vic on 26.12.2020.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends: [friend]!
    var friendsDictionary = [String: [friend]]()
    var friendsSectionTitles = [String]()
    var friendsDataSource: FriendsDataSource!
    var friendImage: UIImage!
    var friendImages: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        friendsDataSource = FriendsDataSource()       
        friends = friendsDataSource.getFriends()
        
        for friend in friends{
            let friendKey = String(friend.name.prefix(1))
            if var friendValues = friendsDictionary[friendKey]{
                friendValues.append(friend)
                friendsDictionary[friendKey] = friendValues
            }else{
                friendsDictionary[friendKey] = [friend]
            }
        }
        
        friendsSectionTitles = [String](friendsDictionary.keys)
        friendsSectionTitles = friendsSectionTitles.sorted(by: { $0 < $1 })
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countFriendsInSection = friendsDictionary[friendsSectionTitles[section]]?.count else { return 0 }
        return countFriendsInSection
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendsTableViewCell{
            let friendKey = friendsSectionTitles[indexPath.section]
            if let friendValues = friendsDictionary[friendKey]{
                cell.friendLabel.text = friendValues[indexPath.row].name
                cell.friendAvatar.image = UIImage(named: friendValues[indexPath.row].avatar)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return friendsSectionTitles[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsSectionTitles
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let friendKey = friendsSectionTitles[indexPath.section]
        if let friendValues = friendsDictionary[friendKey]{
            friendImages = friendValues[indexPath.row].images!
        }
            performSegue(withIdentifier: "toFriendFullImageVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "toFriendFullImageVC":
            if let destination = segue.destination as? FriendCollectionViewController{
                destination.friendImg = friendImages
            }
        default:
            break
        }
    }
    



}
