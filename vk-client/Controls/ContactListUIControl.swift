//
//  ContactListUIControl.swift
//  vk-client
//
//  Created by Vic on 07.01.2021.
//

import UIKit

class ContactListUIControl: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var alphabeticSearchBar: AlphabeticSearchUIControl!
    
    var friends: [friend]!
    var friendsDictionary = [String: [friend]]()
    var friendsSectionTitles = [String]()
    
//    var friendImage: UIImage!
//    var nameFriend: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        friends = [
            friend(name: "Саша", avatar: "neo"),
            friend(name: "Василиса", avatar: "trin"),
            friend(name: "Петя", avatar: "morpheus"),
            friend(name: "Иван", avatar: "noavatar"),
            friend(name: "Игорь", avatar: "noavatar"),
            friend(name: "Smith", avatar: "noavatar"),
            friend(name: "Яхон", avatar: "noavatar"),
            friend(name: "Нори", avatar: "noavatar"),
            friend(name: "Жмых", avatar: "noavatar"),
        ]
        
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
        alphabeticSearchBar.letters = friendsSectionTitles
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return friendsSectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countFriendsInSection = friendsDictionary[friendsSectionTitles[section]]?.count else { return 0 }
        return countFriendsInSection
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactsTableViewCell{
            let friendKey = friendsSectionTitles[indexPath.section]
            if let friendValues = friendsDictionary[friendKey]{
                cell.contactName.text = friendValues[indexPath.row].name
                cell.contactImageView.image = UIImage(named: friendValues[indexPath.row].avatar)
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print(friendsSectionTitles)
        return friendsSectionTitles[section]
    }
    
//    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
//        return friendsSectionTitles
//    }
    
    @IBAction func alphbeticSearchCnanged(_ sender: AlphabeticSearchUIControl) {
        let indexPath = IndexPath(row: 0, section: friendsSectionTitles.firstIndex(of: sender.choosedLetter) ?? 0)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        
    }
    
    
}
