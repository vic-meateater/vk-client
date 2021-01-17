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
    
    private var searchedFriends = [friend]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool){
        friendsDataSource = FriendsDataSource()
        friends = friendsDataSource.getFriends()
        
        //        for friend in friends{
        //            let friendKey = String(friend.name.prefix(1))
        //            if var friendValues = friendsDictionary[friendKey]{
        //                friendValues.append(friend)
        //                friendsDictionary[friendKey] = friendValues
        //            }else{
        //                friendsDictionary[friendKey] = [friend]
        //            }
        //        }
        friendsDictionary = Dictionary(grouping: friends, by: { String($0.name.first!) })
        friendsSectionTitles = [String](friendsDictionary.keys)
        friendsSectionTitles = friendsSectionTitles.sorted(by: { $0 < $1 })
        alphabeticSearchBar.letters = friendsSectionTitles
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return searchedFriends.isEmpty ? friendsSectionTitles.count : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countFriendsInSection = friendsDictionary[friendsSectionTitles[section]]?.count else { return 0 }
        return searchedFriends.isEmpty ? countFriendsInSection : searchedFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ContactsTableViewCell{
            var friendValues: friend? = nil
            let friendKey = friendsSectionTitles[indexPath.section]
            if searchedFriends.isEmpty {
                friendValues = friendsDictionary[friendKey]?[indexPath.row]
            }else{
                friendValues = searchedFriends[indexPath.row]
            }
            cell.set(friendValues: friendValues!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let uiView = UIView()
        uiView.backgroundColor = .systemGray2
        uiView.layer.opacity = 0.6
        uiView.addSubview(label)

        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: uiView.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            label.centerYAnchor.constraint(equalTo: uiView.centerYAnchor)
        ])
        if searchedFriends.isEmpty {
            label.text = friendsSectionTitles[section]
        }else{
            label.text = "Лучшие совпадения"
        }
        return uiView
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
        let indexPath = IndexPath(row: 0, section: friendsSectionTitles.firstIndex(of: sender.choosedLetter ?? "") ?? 0)
        tableView.scrollToRow(at: indexPath, at: .middle, animated: true)
        
    }
    
    @IBAction func dragAlphabeticSearchView(_ sender: UIGestureRecognizer){
        let scrollPosition = sender.location(in: alphabeticSearchBar)
        let coef = Int(alphabeticSearchBar.frame.height) / friendsSectionTitles.count
        let letterIndex = Int(scrollPosition.y) / coef
        
        alphabeticSearchBar.choosedLetter = friendsSectionTitles[letterIndex]
    }
    
}

extension ContactListUIControl: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){

        guard let searchText = searchBar.text else {
            return
        }
        searchedFriends = friends.filter {$0.name.lowercased().contains(searchText.lowercased())}
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchedFriends = [friend]()
        view.endEditing(true)
    }
}
