//
//  UIKitExtensions.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 14/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

// MARK: UIKit Extensions

public extension UIViewController {
    
    func showNoActionAlert(_ withTitle: String, message: String) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
    
}

public extension UIButton {
    
    func makeOvalBtn(_ withColor: UIColor, withAlpha: CGFloat) {
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
        if withAlpha < 1 {
            isEnabled = false
        } else {
            isEnabled = true
        }
        backgroundColor = withColor.withAlphaComponent(withAlpha)
    }
    
}

public extension UITextField {
    
    func addToggle(_ image: UIImage) -> UIButton {
        rightViewMode = .unlessEditing
        let toggleButton = UIButton(frame: CGRect(x: frame.size.width - 25, y: 5, width: 15, height: 25))
        toggleButton.setImage(image, for: .normal)
        toggleButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: -24, bottom: 5, right: 15)
        toggleButton.accessibilityIdentifier = "toggleButton"
        rightView = toggleButton
        rightViewMode = .always
        isSecureTextEntry = true
        
        return toggleButton
    }
    
}

// MARK: Rest Extensions

public extension String {
    
    func isEmailValid() -> Bool {
        
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
