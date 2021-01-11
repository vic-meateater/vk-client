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
    var friendImage: UIImage!
    var friendsDataSource: FriendsDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool){
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
        return friendsSectionTitles[section]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "fromCustomContactsVC"{
            if let destination = segue.destination as? FriendCollectionViewController{
                let index = tableView.indexPathForSelectedRow
                let friendKey = friendsSectionTitles[index?.section ?? 65536]
                if let friendValues = friendsDictionary[friendKey]{
                    let avatar = friendValues[index?.row ?? 65535].images
                    destination.friendImg = avatar
                }
            }
        }
    }
    
    @IBAction func alphbeticSearchCnanged(_ sender: AlphabeticSearchUIControl) {
        let indexPath = IndexPath(row: 0, section: friendsSectionTitles.firstIndex(of: sender.choosedLetter) ?? 0)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        
    }
    
    @IBAction func drugAlphabrticSearchView(_ sendex: UIGestureRecognizer){
        print(#function)
    }
    
    
}
