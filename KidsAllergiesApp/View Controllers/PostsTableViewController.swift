//
//  PostsTableViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 28/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    // MARK: - Private Variables
    private final let cellID = "postListItem"
    private var postsListViewModel = [PostListViewModel]()
    private var selectedID = Int(0)

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupNavigation(withTitle: "Our Community")
        addRightBarButton(withImage: UIImage(named: "add")!)
        setupTableViewProperties()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        setupPosts()
        hideKeyboardTap()
    }
    
    // MARK: Setup Methods
    private func setupPosts() {
        for post in posts {
            postsListViewModel.append(PostListViewModel(post: post))
        }
        
        tableView.reloadData()
    }

    // MARK: Overriden Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postsListViewModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! PostTableViewCell
        cell.postListViewModel = postsListViewModel[indexPath.row]
        
        return cell
    }
}
