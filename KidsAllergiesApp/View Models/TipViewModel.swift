//
//  TipViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 28/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

public struct TipViewModel {
    
    let title: String
    let description: String
    let image: UIImage
    let chip: String
    
    // DI
    init(tip: Tip) {
        self.title = tip.tipTitle
        self.description = tip.tipDescr
        self.image = tip.tipImage
        self.chip = tip.tipCat.rawValue
        
    }
    
}