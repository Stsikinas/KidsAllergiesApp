//
//  User.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 19/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

public struct User {
    var name: String
    var surname: String
    var username: String
    var password: String
    var categories: [String]
    
    static var className: String {
        return String(describing: self)
    }
    
}
