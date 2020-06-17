//
//  RecipesTableViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 28/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class RecipesTableViewController: UITableViewController, ClickedFavouriteDelegate {
    
    // MARK: - Private Variables
    private final let cellID = "recipeListItem"
    private var recipesViewModel = [RecipeListViewModel]()
    private var selectedID = Int(0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation(withTitle: "Recipes")
        setupTableViewProperties()
        tableView.register(RecipesTableViewCell.self, forCellReuseIdentifier: cellID)
        setupRecipesList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (tabBarController?.tabBar.isHidden)! {
            tabBarController?.tabBar.isHidden = false
        }
    }
    
    // MARK: Setup Methods
    private func setupRecipesList() {
        for recipe in recipes {
            recipesViewModel.append(RecipeListViewModel(recipeListItem: recipe))
        }
        
        tableView.reloadData()
    }

    
    // MARK: Override Methods
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! RecipesTableViewCell
        cell.recipeListViewModel = recipesViewModel[indexPath.row]
        cell.delegate = self
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedID = indexPath.row
        performSegue(withIdentifier: "showRecipe", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipe" {
            guard let detailVC = segue.destination as? RecipeViewController else {
                return
            }
            detailVC.selectedID = self.selectedID
            detailVC.isHeroEnabled = true
        }
    }
    
    // MARK: Delegate Methods
    func cell(_ tableViewCell: RecipesTableViewCell, tappedModel: RecipeListViewModel) {
        
    }

}
