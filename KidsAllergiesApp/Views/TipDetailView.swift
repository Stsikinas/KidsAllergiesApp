//
//  TipDetailView.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 24/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class TipDetailView: UIView {
    
    // MARK: Subview Initializers
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .lightBeige
        return scrollView
    }()
    var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AmericanTypewriter", size: 32.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    
    // MARK: Use VM to update cell UI
    var tipDetailViewModel: TipDetailViewModel! {
        didSet {
            titleLabel.text = tipDetailViewModel.title
        }
    }
    
    // MARK: Class Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(scrollView)
        scrollView.addAnchors(wAnchor: widthAnchor, 0.9, hAnchor: heightAnchor, 0.9, cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
        scrollView.addSubview(titleLabel)
        titleLabel.addAnchors(wAnchor: scrollView.widthAnchor, 0.75, lAnchor: scrollView.leftAnchor, leftConstant: 12, tAnchor: scrollView.topAnchor, topConstant: 12)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
