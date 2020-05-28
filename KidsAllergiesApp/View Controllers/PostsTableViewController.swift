//
//  PostsTableViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 28/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupNavigation(withImage: UIImage(named: "community_title.png"))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
