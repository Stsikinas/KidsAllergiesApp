//
//  TipDetailViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 24/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit


public struct TipDetailViewModel {
    
    // MARK: Variables
    let title: String
    let description: String
    let tipCategory: TipCategory
    
    // DI
    init(tipDetailItem: Tip) {
        self.title = tipDetailItem.tipTitle
        self.description = tipDetailItem.tipDescr
        self.tipCategory = tipDetailItem.tipCat
    }
    
    // Update View Methods
    func setBackground(ofView: UIView,_ alpha: CGFloat) {
        switch tipCategory {
        case .Baby:
            ofView.addBackground(color: .babyPink, withAlpha: alpha)
            break
        case .Development:
            ofView.addBackground(color: .lightSaturatedRed, withAlpha: alpha)
            break
        case .Medicines:
            ofView.addBackground(color: .strongBlue, withAlpha: alpha)
            break
        case .Mom:
            ofView.addBackground(color: .lilac, withAlpha: alpha)
            break
        case .Products:
            ofView.addBackground(color: .veraman, withAlpha: alpha)
            break
        case .Shops:
            ofView.addBackground(color: .gold, withAlpha: alpha)
            break
        }
    }
    
}
