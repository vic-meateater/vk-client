//
//  GlobalGroupsTableViewController.swift
//  vk-client
//
//  Created by Vic on 29.12.2020.
//

import UIKit

class GlobalGroupsTableViewController: UITableViewController {

    var groups: [group]!
    var groupsDictionary = [String: [group]]()
    var groupsSectionTitles = [String]()
    
    var searchedGroups = [group]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        groups = [
            group(name: "Network_GB", image: "group_network"),
            group(name: "Python_GB", image: "group_python"),
            group(name: "GeekBrains", image: "group_gb"),
            group(name: "iOS_GB", image: "group_ios"),
        ]
        
//        for group in groups{
//            let groupKey = String(group.name.prefix(1))
//            if var groupValues = groupsDictionary[groupKey]{
//                groupValues.append(group)
//                groupsDictionary[groupKey] = groupValues
//            }else{
//                groupsDictionary[groupKey] = [group]
//            }
//        }
        
        groupsDictionary = Dictionary(grouping: groups, by: { String($0.name.first!) })
        groupsSectionTitles = [String](groupsDictionary.keys)
        groupsSectionTitles = groupsSectionTitles.sorted(by: { $0 < $1 })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return searchedGroups.isEmpty ? groupsSectionTitles.count : 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countGroupsInSection = groupsDictionary[groupsSectionTitles[section]]?.count else { return 0 }
        return searchedGroups.isEmpty ? countGroupsInSection : searchedGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GlobalGroupTableViewCell{
            var groupValues: group? = nil
            let groupKey = groupsSectionTitles[indexPath.section]
            //let sortedGroups = groups.sorted {$0.name < $1.name}
            if searchedGroups.isEmpty {
                groupValues = groupsDictionary[groupKey]?[indexPath.row]
            }else{
                groupValues = searchedGroups[indexPath.row]
            }
            //let image = UIImage(named: groupValues!.image)
            cell.globalGroupImage.image = UIImage(named: groupValues!.image)
            cell.globalGroupLabel.text = groupValues!.name
 //           cell.globalGroupImage.image = UIImage(named: groups[indexPath.row].image)
 //           cell.globalGroupLabel.text = groups[indexPath.row].name
            
            return cell
        }
        
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return groupsSectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
        if searchedGroups.isEmpty {
            label.text = groupsSectionTitles[section]
        }else{
            label.text = "Лучшие совпадения"
        }
        return uiView
    }

}

extension GlobalGroupsTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){

        guard let searchText = searchBar.text else {
            return
        }
        searchedGroups = groups.filter {$0.name.lowercased().contains(searchText.lowercased())}
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
        searchedGroups = [group]()
        view.endEditing(true)
    }
}
