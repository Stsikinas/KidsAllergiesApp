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
                          likesNum: 125,
                          date: Date(timeIntervalSinceNow: -2587778)),
                     Post(id: 1,
                          postText: "Donec pellentesque gravida leo, ac malesuada metus pharetra nec.",
                          editor: "Jane Doe",
                          commentsNum: 4,
                          likesNum: 25,
                          date: .yesterday)]
let tips: [Tip] = [Tip(id: 0,
                       tipTitle: "Lorem Ipsum",
                       tipDescr: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum consequat. Donec pellentesque gravida leo, ac malesuada metus pharetra nec. Etiam in fringilla odio, vel sagittis nulla. Proin volutpat gravida tortor non bibendum. Duis vel metus at quam imperdiet varius consectetur eget mauris. Sed vel efficitur sapien. Mauris bibendum sed ipsum quis hendrerit. Donec vestibulum iaculis augue. Cras ut iaculis elit. Praesent a mollis velit. Donec ac elit viverra, rhoncus sem sit amet, viverra metus. Proin feugiat, velit eget cursus condimentum, libero lectus aliquam quam, quis vehicula orci diam eu nulla.",
                       tipImage: UIImage(named: "mom_tips.png")!,
                       tipCat: TipCategory.Mom),
                   Tip(id: 1,
                       tipTitle: "Lorem Ipsum",
                       tipDescr: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum consequat. Donec pellentesque gravida leo, ac malesuada metus pharetra nec. Etiam in fringilla odio, vel sagittis nulla. Proin volutpat gravida tortor non bibendum. Duis vel metus at quam imperdiet varius consectetur eget mauris. Sed vel efficitur sapien. Mauris bibendum sed ipsum quis hendrerit. Donec vestibulum iaculis augue. Cras ut iaculis elit. Praesent a mollis velit. Donec ac elit viverra, rhoncus sem sit amet, viverra metus. Proin feugiat, velit eget cursus condimentum, libero lectus aliquam quam, quis vehicula orci diam eu nulla.",
                       tipImage: UIImage(named: "mom_tips.png")!,
                       tipCat: TipCategory.Baby),
                   Tip(id: 2,
                       tipTitle: "Lorem Ipsum",
                       tipDescr: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum consequat. Donec pellentesque gravida leo, ac malesuada metus pharetra nec. Etiam in fringilla odio, vel sagittis nulla. Proin volutpat gravida tortor non bibendum. Duis vel metus at quam imperdiet varius consectetur eget mauris. Sed vel efficitur sapien. Mauris bibendum sed ipsum quis hendrerit. Donec vestibulum iaculis augue. Cras ut iaculis elit. Praesent a mollis velit. Donec ac elit viverra, rhoncus sem sit amet, viverra metus. Proin feugiat, velit eget cursus condimentum, libero lectus aliquam quam, quis vehicula orci diam eu nulla.",
                       tipImage: UIImage(named: "mom_tips.png")!,
                       tipCat: TipCategory.Products),
                   Tip(id: 3,
                       tipTitle: "Lorem Ipsum",
                       tipDescr: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum consequat. Donec pellentesque gravida leo, ac malesuada metus pharetra nec. Etiam in fringilla odio, vel sagittis nulla. Proin volutpat gravida tortor non bibendum. Duis vel metus at quam imperdiet varius consectetur eget mauris. Sed vel efficitur sapien. Mauris bibendum sed ipsum quis hendrerit. Donec vestibulum iaculis augue. Cras ut iaculis elit. Praesent a mollis velit. Donec ac elit viverra, rhoncus sem sit amet, viverra metus. Proin feugiat, velit eget cursus condimentum, libero lectus aliquam quam, quis vehicula orci diam eu nulla.",
                       tipImage: UIImage(named: "mom_tips.png")!,
                       tipCat: TipCategory.Shops),
                   Tip(id: 4,
                       tipTitle: "Lorem Ipsum",
                       tipDescr: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum consequat. Donec pellentesque gravida leo, ac malesuada metus pharetra nec. Etiam in fringilla odio, vel sagittis nulla. Proin volutpat gravida tortor non bibendum. Duis vel metus at quam imperdiet varius consectetur eget mauris. Sed vel efficitur sapien. Mauris bibendum sed ipsum quis hendrerit. Donec vestibulum iaculis augue. Cras ut iaculis elit. Praesent a mollis velit. Donec ac elit viverra, rhoncus sem sit amet, viverra metus. Proin feugiat, velit eget cursus condimentum, libero lectus aliquam quam, quis vehicula orci diam eu nulla.",
                       tipImage: UIImage(named: "mom_tips.png")!,
                       tipCat: TipCategory.Medicines),
                   Tip(id: 5,
                       tipTitle: "Lorem Ipsum",
                       tipDescr: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eget nisl a augue interdum consequat. Donec pellentesque gravida leo, ac malesuada metus pharetra nec. Etiam in fringilla odio, vel sagittis nulla. Proin volutpat gravida tortor non bibendum. Duis vel metus at quam imperdiet varius consectetur eget mauris. Sed vel efficitur sapien. Mauris bibendum sed ipsum quis hendrerit. Donec vestibulum iaculis augue. Cras ut iaculis elit. Praesent a mollis velit. Donec ac elit viverra, rhoncus sem sit amet, viverra metus. Proin feugiat, velit eget cursus condimentum, libero lectus aliquam quam, quis vehicula orci diam eu nulla.",
                       tipImage: UIImage(named: "mom_tips.png")!,
                       tipCat: TipCategory.Development)]
