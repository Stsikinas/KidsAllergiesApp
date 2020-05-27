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
    
    // MARK: Log-in/out methods
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: loggedInUser)
    }
    
    func loginUser() {
        UserDefaults.standard.set(true, forKey: loggedInUser)
        UserDefaults.standard.synchronize()
    }
    
    func logoutUser() {
        UserDefaults.standard.set(false, forKey: loggedInUser)
        UserDefaults.standard.synchronize()
    }
    
    // MARK: Register User methods
    func getRegisteredUser() -> User? {
        do {
            if let userAsData = UserDefaults.standard.object(forKey: userCreated) as? Data {
                if let user = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(userAsData) as? User {
                    print("User: \(user.name) \(user.surname) is already registered!")
                    return user
                }
            }
        } catch (let error) {
            #if DEBUG
                print("Failed to convert Data to User : \(error.localizedDescription)")
            #endif
        }
        return nil
    }
    
    func create(_ user: User) {
        do {
            let userAsData = try NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
            UserDefaults.standard.set(userAsData, forKey: userCreated)
            UserDefaults.standard.synchronize()
        } catch (let error) {
            #if DEBUG
                print("Failed to convert User to Data : \(error.localizedDescription)")
            #endif
        }
    }
    
}
