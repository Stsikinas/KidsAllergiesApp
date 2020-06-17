//
//  RecipeViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 5/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

public struct RecipeListViewModel {
    
    // MARK: Variables
    let title: String
    let image: UIImage
    let imageBright: Bool
    var favourite: Bool
    
    // MARK: Dependency Injection
    init(recipeListItem: Recipe) {
        self.title = recipeListItem.title
        self.image = recipeListItem.image
        self.favourite = recipeListItem.isFavourite
        self.imageBright = recipeListItem.isBrightImage
    }
    
    // MARK: Setters
    public mutating func setFavourite(_ isFavourite: Bool) {
        favourite = isFavourite
    }
    
}
