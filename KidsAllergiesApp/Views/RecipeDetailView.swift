//
//  RecipeDetailView.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 12/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class RecipeDetailView: UIView {

    // MARK: Subview Initializers
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .lightBeige
        return scrollView
    }()
    
    var recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.heroID = recipeImageID
        return imageView
    }()
    
    // MARK: Use VM to update cell UI
    var recipeDetailViewModel: RecipeDetailViewModel! {
        didSet {
            recipeImage.image = recipeDetailViewModel.image
        }
    }
    
    // MARK: Class Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hero.isEnabled = true
        hero.modifiers = [.fade]
        addSubview(scrollView)
        scrollView.addAnchors(wAnchor: widthAnchor, 1.0, hAnchor: heightAnchor, 1.0, cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
        scrollView.addSubview(recipeImage)
        recipeImage.addAnchors(wAnchor: widthAnchor, 1.0, hAnchor: heightAnchor, 0.3, cXAnchor: centerXAnchor, tAnchor: topAnchor)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
