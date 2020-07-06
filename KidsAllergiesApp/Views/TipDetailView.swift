//
//  TipDetailView.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 24/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

/// Protocol to dismiss parent View Controller, by a view's subview
protocol dismissDetailViewDelegate {
    func dismissView()
}

class TipDetailView: UIView {
    
    var delegate: dismissDetailViewDelegate?
    
    // MARK: Subview Initializers
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = UIColor(named: "tips_background")
        return scrollView
    }()
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "AmericanTypewriter", size: 32.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    lazy var tipText: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AmericanTypewriter", size: 18.0)
        label.numberOfLines = 0
        return label
    }()
    lazy var closeButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 120))
        button.setTitle("Got it!", for: .normal)
        return button
    }()
    
    // MARK: Use VM to update cell UI
    var tipDetailViewModel: TipDetailViewModel! {
        didSet {
            titleLabel.text = tipDetailViewModel.title
            tipText.text = tipDetailViewModel.description
            tipDetailViewModel.setBackground(ofView: closeButton, 1.0)
        }
    }
    
    // MARK: Class Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(closeButton)
        closeButton.addAnchors(wAnchor: widthAnchor, 0.9, cXAnchor: centerXAnchor, bAnchor: bottomAnchor, bottomConstant: -30)
        addSubview(scrollView)
        scrollView.addAnchors(wAnchor: widthAnchor, 0.9, cXAnchor: centerXAnchor, tAnchor: topAnchor, topConstant: 50, bAnchor: closeButton.topAnchor)
        scrollView.addSubview(titleLabel)
        titleLabel.addAnchors(wAnchor: scrollView.widthAnchor, 0.75, lAnchor: scrollView.leftAnchor, leftConstant: 12, tAnchor: scrollView.topAnchor, topConstant: 12)
        scrollView.addSubview(tipText)
        tipText.addAnchors(wAnchor: scrollView.widthAnchor, 0.85, lAnchor: scrollView.leftAnchor, leftConstant: 6, tAnchor: titleLabel.bottomAnchor, topConstant: 20, bAnchor: scrollView.bottomAnchor, bottomConstant: -12)
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Cell Interaction Methods
    @objc func closeView() {
        if let delegate = delegate {
            delegate.dismissView()
        }
    }

}
