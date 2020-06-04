//
//  User.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 19/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

public class User: NSObject, NSCoding {
    
    var name: String
    var surname: String
    var username: String
    var password: String
    let userType: String
    
    init(name: String, surname: String, username: String, password: String) {
        self.name = name
        self.surname = surname
        self.username = username
        self.password = password
        self.userType = UserCategory.Parent.rawValue
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(surname, forKey: "surname")
        coder.encode(username, forKey: "username")
        coder.encode(password, forKey: "password")
    }
    
    public required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let surname = coder.decodeObject(forKey: "surname") as! String
        let username = coder.decodeObject(forKey: "username") as! String
        let password = coder.decodeObject(forKey: "password") as! String
        
        self.init(name: name, surname: surname, username: username, password: password)
    }
    
    static var className: String {
        return String(describing: self)
    }
    
}
