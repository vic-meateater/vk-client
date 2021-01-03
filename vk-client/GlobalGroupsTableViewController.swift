//
//  GlobalGroupsTableViewController.swift
//  vk-client
//
//  Created by Vic on 29.12.2020.
//

import UIKit

class GlobalGroupsTableViewController: UITableViewController {

    var groups: [group]!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        groups = [
            group(name: "GB_Network", image: "group_network"),
            group(name: "GB_Python", image: "group_python"),
            group(name: "GeekBrains", image: "group_gb"),
        ]

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? GlobalGroupTableViewCell{
            let sortedGroups = groups.sorted {$0.name < $1.name}
            cell.globalGroupImage.image = UIImage(named: sortedGroups[indexPath.row].image)
            cell.globalGroupLabel.text = sortedGroups[indexPath.row].name
            
            return cell
        }
        
        return UITableViewCell()
    }

}
