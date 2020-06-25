//
//  TipListViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 28/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

public struct TipListViewModel {
    
    let id: Int
    let title: String
    let description: String
    let image: UIImage
    let tipCategory: TipCategory
    let chip: String
    
    init(tip: Tip) {
        self.id = tip.id
        self.title = tip.tipTitle
        self.description = tip.tipDescr
        self.image = tip.tipImage
        self.tipCategory = tip.tipCat
        self.chip = tip.tipCat.rawValue
        
    }
    
}
