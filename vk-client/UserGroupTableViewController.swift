//
//  UserGroupTableViewController.swift
//  vk-client
//
//  Created by Vic on 29.12.2020.
//

import UIKit


var userGroups: [group] = []

class UserGroupTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        userGroups = [
        ]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return userGroups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UserGroupTableViewCell{
            let sortedGroups = userGroups.sorted {$0.name < $1.name}
            cell.userGroupNameLabel.text = sortedGroups[indexPath.row].name
            cell.userGroupImage.image = UIImage(named: sortedGroups[indexPath.row].image)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            userGroups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    @IBAction func unwindFromGlobalUserGroupsViewController(_ segue: UIStoryboardSegue){
        guard let tableViewController = segue.source as? GlobalGroupsTableViewController,
              let indexPath = tableViewController.tableView.indexPathForSelectedRow else {return}
        
        let group = tableViewController.groups[indexPath.row]
        if userGroups.contains(where: {$0.name == group.name }){return}
        tableViewController.groups.remove(at: indexPath.row)
        userGroups.append(group)
        tableView.reloadData()
    }
}
