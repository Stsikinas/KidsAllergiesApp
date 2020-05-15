//
//  AccountHelper.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 4/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation

public class AccountHelper {
    
    // Create Singleton of the Account Helper class
    static let shared = AccountHelper()
    
    // MARK: Log-in/out funcs
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "loggedInUser")
    }
    
    func setNewUser() {
        UserDefaults.standard.set(true, forKey: "loggedInUser")
    }
    
    func logoutUser() {
        UserDefaults.standard.set(false, forKey: "loggedInUser")
    }
    
}
