//
//  UserViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 20/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation


public struct UserViewModel {
    
    var fullname: String
    var email: String
    var userChip: String
    var category: UserCategory
    
    init(user: User) {
        self.fullname = TextUtils.shared.concat(values: [user.name, user.surname])
        self.email = user.username
        self.userChip = user.userChip
        self.category = user.userCat
    }
    
}
