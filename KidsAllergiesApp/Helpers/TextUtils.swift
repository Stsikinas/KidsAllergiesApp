//
//  TextUtils.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 14/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation


public class TextUtils {

    // Create Singleton of the Account Helper class
    static let shared = TextUtils()

    public func trim(_ text: String?) -> String {
        if text == nil {
            return ""
        }
        return text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    }

}
