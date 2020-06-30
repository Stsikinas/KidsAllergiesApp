//
//  RecipesTableViewCell.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 5/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

protocol ClickedFavouriteDelegate {
    func cell(_ tableViewCell: RecipesTableViewCell, tappedModel: RecipeListViewModel)
}

class RecipesTableViewCell: UITableViewCell {
    
    var delegate: ClickedFavouriteDelegate?
    
    // MARK: Subview Initializers
    lazy var recipeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    lazy var recipeTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Futura-Medium", size: 22.0)
        titleLabel.textColor = .darkGray
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    lazy var favouriteButton: UIButton = {
        let button = UIButton(type: .custom)
        return button
    }()
    
    // MARK: Use VM to update cell UI
    var recipeListViewModel: RecipeListViewModel! {
        didSet {
            recipeImage.image = recipeListViewModel.image
            recipeTitle.text = recipeListViewModel.title
            initializeButton()
            if !recipeListViewModel.imageBright {
                recipeTitle.textColor = .white
            }
        }
    }
    
    // MARK: Class Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        addSubview(recipeImage)
        recipeImage.addAnchors(wAnchor: widthAnchor, 1.0, hAnchor: heightAnchor, 1.0, cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
        addSubview(recipeTitle)
        recipeTitle.addAnchors(wAnchor: widthAnchor, 0.8, lAnchor: leftAnchor, leftConstant: 8, bAnchor: bottomAnchor, bottomConstant: -12)
        addSubview(favouriteButton)
        favouriteButton.addAnchors(tAnchor: topAnchor, topConstant: 15, rAnchor: rightAnchor, rightConstant: -30)
        favouriteButton.addTarget(self, action: #selector(tappedFavourite), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Cell Interaction Methods
    @objc func tappedFavourite() {
        if let delegate = delegate {
            recipeListViewModel.setFavourite(!recipeListViewModel.favourite)
            delegate.cell(self, tappedModel: recipeListViewModel)
        }
    }
    private func initializeButton() {
        if recipeListViewModel.favourite {
            favouriteButton.set(color: AppUtility().primaryColor, forImage: UIImage(named: "fav.png")!)
        } else {
            favouriteButton.set(color: AppUtility().primaryColor, forImage: UIImage(named: "no_fav.png")!)
        }
    }
}
