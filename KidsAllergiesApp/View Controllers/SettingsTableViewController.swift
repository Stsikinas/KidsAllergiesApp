//
//  SettingsTableViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 3/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    // MARK: Private Variables
    private final let avatarCell = "avatarCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation(withTitle: "My Account")
        setupTableViewProperties()
        tableView.register(AvatarTableViewCell.self, forCellReuseIdentifier: avatarCell)
        
        
    }

    // MARK: Overriden Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 220
        default:
            return 44
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: avatarCell, for: indexPath) as! AvatarTableViewCell
        cell.userViewModel = UserViewModel(user: AccountHelper.shared.getRegisteredUser() ??
            User(name: "", surname: "", username: "", password: ""))
        
        return cell
    }

}
