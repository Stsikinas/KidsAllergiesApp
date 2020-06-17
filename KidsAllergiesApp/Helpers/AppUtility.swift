//
//  AppUtility.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 18/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

struct AppUtility {
    
    public let primaryColor = UIColor(red: 0, green: 0.675, blue: 0.290, alpha: 1.0)
    public static let passRules = "required: lower; required: upper; required: digit; minlength: 8;"
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    static func createPasswordRules() -> UITextInputPasswordRules {
        return UITextInputPasswordRules(descriptor: passRules)
    }
    
    static func isValid(_ password: String, forRules: String) -> Bool {
        var lower = true
        var upper = true
        var digit = true
        var minimum = true
        var maximum = true
        
        // Split rules to use in switch
        let rules = forRules.replacingOccurrences(of: "required:", with: "")
            .replacingOccurrences(of: " ", with: "")
            .split(separator: ";", maxSplits: forRules.count, omittingEmptySubsequences: true)
        
        for rule in rules {
            
            switch rule {
            case "lower":
                let lowerLetterRegEx  = ".*[a-z]+.*"
                let texttest = NSPredicate(format:"SELF MATCHES %@", lowerLetterRegEx)
                lower = texttest.evaluate(with: password)
                break
            case "upper":
                let capitalLetterRegEx  = ".*[A-Z]+.*"
                let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
                upper = texttest.evaluate(with: password)
                break
            case "digit":
                let digitRegEx  = ".*[0-9]+.*"
                let texttest = NSPredicate(format:"SELF MATCHES %@", digitRegEx)
                digit = texttest.evaluate(with: password)
                break
            default:
                // minlength & maxlength are complex rules, so use the "default" case
                if rule.contains("minlength") {
                    let minNumber = Int(rule.split(separator: ":", maxSplits: 2, omittingEmptySubsequences: true).last ?? "0")
                    minimum = password.count >= minNumber!
                } else if rule.contains("maxlength") {
                    let maxNumber = Int(rule.split(separator: ":", maxSplits: 2, omittingEmptySubsequences: true).last ?? "0")
                    maximum = password.count < maxNumber!
                }
                break
            }
            
        }
        
        return lower && upper && digit && minimum && maximum
    }
    
    func timeToString(mins: TimeInterval) -> String {
        let hours = Int(mins) / 60 % 60
        let minutes = Int(mins) % 60
        
        return String(format: "%1i'%1i\"", hours, minutes)
    }
    
}
