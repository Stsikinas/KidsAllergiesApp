//
//  RecipeDetailViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 12/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit


public struct RecipeDetailViewModel {
    
    // MARK: Variables
    var title: String
    var descr: String
    var prepTime: Int
    var ingredients: String
    var image: UIImage
    var isBrightImage: Bool
    var stars: Int
    var editor: String
    var isFavourite: Bool
    
    // DI
    init(recipeDetailItem: Recipe) {
        self.title = recipeDetailItem.title
        self.descr = recipeDetailItem.descr
        self.prepTime = recipeDetailItem.prepTime
        self.ingredients = recipeDetailItem.ingredients
        self.image = recipeDetailItem.image
        self.isBrightImage = recipeDetailItem.isBrightImage
        self.stars = recipeDetailItem.stars
        self.editor = recipeDetailItem.editor
        self.isFavourite = recipeDetailItem.isFavourite
    }
    
}
