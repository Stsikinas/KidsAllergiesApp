//
//  UIKitExtensions.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 14/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    func showNoActionAlert(_ withTitle: String, message: String) {
        let alert = UIAlertController(title: withTitle, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: false, completion: nil)
    }
    
}
