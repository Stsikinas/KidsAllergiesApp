//
//  TagButton.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 2/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

/// Button that looks like material chip
class TagButton: UIButton {

    override init(frame: CGRect) { super.init(frame: frame) }
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    /// Setup button by making:
    /// * initial background color
    /// * initial titlle color
    /// * add cool font
    /// * make rounded button (like material chips)
    /// * give space between text and button edges
    func setupButton() {
        
        backgroundColor = AppUtility().primaryColor
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "AvenirNext-Bold", size: 15.0)
        layer.cornerRadius = 5
        contentEdgeInsets = UIEdgeInsets(top: 3, left: 12, bottom: 3, right: 12)
        isEnabled = false
        
    }
    
    /// Update background color and text color of chip based on Tip Category
    func updateButtonColor(_ forTipCategory: TipCategory) {
        switch forTipCategory {
        case .Baby:
            backgroundColor = UIColor.babyPink
            setTitleColor(.white, for: .normal)
            break
        case .Mom:
            backgroundColor = UIColor.lilac
            setTitleColor(.white, for: .normal)
            break
        case .Products:
            backgroundColor = UIColor.veraman
            setTitleColor(.white, for: .normal)
            break
        case .Shops:
            backgroundColor = UIColor.gold
            setTitleColor(.white, for: .normal)
            break
        case .Medicines:
            backgroundColor = UIColor.strongBlue
            setTitleColor(.white, for: .normal)
            break
        case .Development:
            backgroundColor = UIColor.lightSaturatedRed
            setTitleColor(.white, for: .normal)
            break
        }
    }

}
