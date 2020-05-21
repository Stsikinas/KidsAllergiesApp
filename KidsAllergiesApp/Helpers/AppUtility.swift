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
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }
    
    public let primaryColor = UIColor(red: 0, green: 0.675, blue: 0.290, alpha: 1.0)
    
    
}
