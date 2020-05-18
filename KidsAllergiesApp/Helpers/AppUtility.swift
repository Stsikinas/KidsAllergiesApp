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
    
    
}
