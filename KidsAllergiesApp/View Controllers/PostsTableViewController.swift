//
//  PostsTableViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 28/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController, newPostReceivedDelegate {
    
    // MARK: - Private Variables
    private final let cellID = "postListItem"
    private var postsListViewModel = [PostListViewModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation(withTitle: "Our Community")
        addRightBarButton(withImage: UIImage(named: "add")!)
        guard let newPostBarButton = navigationItem.rightBarButtonItem else {
            return
        }
        newPostBarButton.action = #selector(openNewPost)
        setupTableViewProperties()
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        setupPosts()
        hideKeyboardTap()
    }
    
    // MARK: Setup Methods
    private func setupPosts() {
        // Update View model with new data
        if postsListViewModel.count != 0 {
            postsListViewModel.removeAll()
        }
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
    
    // MARK: Delegate Methods
    func received(post: Post) {
        posts.insert(post, at: 0)
        setupPosts()
    }
    
    
    // MARK: Obj-C Methods
    @objc func openNewPost() {
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        if let addVC = storyboard.instantiateViewController(withIdentifier: "newPostVC") as? AddNewPostViewController {
            addVC.modalPresentationStyle = .pageSheet
            addVC.delegate = self
            // Add navigation controller to modal view, to add bar button items
            let navController = UINavigationController(rootViewController: addVC)
            present(navController, animated: true, completion: nil)
        }
    }
    
}
