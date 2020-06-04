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
    var userCategory: String
    
    init(user: User) {
        self.fullname = TextUtils.shared.concat(values: [user.name, user.surname])
        self.email = user.username
        self.userCategory = user.userType
    }
    
}
