//
//  Consts.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 25/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

// MARK: Notification Constants

// MARK: User Defaults Keys
let userCreated = "user-created"
let loggedInUser = "user-logged-in"

// MARK: Hero IDs
let recipeImageID = "hero-recipe-image"
let recipeTitleID = "hero-recipe-title"

// MARK: Demo Models
let recipes: [Recipe] = [Recipe(id: 0,
                                title: "Chicken Curry",
                                descr: "Bla Bla Bla Bla",
                                prepTime: 65,
                                ingredients: "rice;chicken;salt;paper",
                                image: UIImage(named: "curry.png")!,
                                isBrightImage: true,
                                stars: 4,
                                editor: "John Doe",
                                isFavourite: true),
                         Recipe(id: 1,
                                title: "Vegetable Curry",
                                descr: "Bla Bla Bla Bla",
                                prepTime: 95,
                                ingredients: "rice;potato;zucchini;salt;paper",
                                image: UIImage(named: "veggy_curry.png")!,
                                isBrightImage: false,
                                stars: 5,
                                editor: "John Doe",
                                isFavourite: false)]
let posts: [Post] = [Post(id: 0,
                          postText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum con.",
                          editor: "John Doe",
                          commentsNum: 12,
                          likesNum: 88,
                          placeholderImage: UIImage(named: "placeholder.png")!,
                          date: .yesterday)]
