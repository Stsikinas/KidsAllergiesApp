//
//  RecipeViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 12/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    // MARK: - Public Variables
    var selectedID: Int?
    
    
    // MARK: - Private Variables
    private final let cellID = "recipeListItem"
    private var recipeDetailViewModel: RecipeDetailViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedID == nil {
            return
        }
        // Find recipe based on ID
        recipeDetailViewModel = RecipeDetailViewModel(recipeDetailItem: recipes.first(where: { $0.id == selectedID })!)
        let detailView = RecipeDetailView(frame: view.frame)
        detailView.recipeDetailViewModel = recipeDetailViewModel
        view.addSubview(detailView)
        
        tabBarController?.tabBar.isHidden = true
        addCancelButton()
        setupNavigation(withTitle: recipeDetailViewModel?.title)
        hero.isEnabled = true
    }
}
