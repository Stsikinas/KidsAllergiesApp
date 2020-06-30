//
//  TipsTableViewCell.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 29/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class TipsTableViewCell: UITableViewCell {

    lazy var textView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.cardView(ofRadius: 12.0, withShadow: UIColor.gray)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AmericanTypewriter", size: 28.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Book", size: 16.0)
        label.numberOfLines = 3
         return label
    }()
    lazy var tipImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.cardView(ofRadius: 15.0)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    lazy var tipButton: TagButton = {
        let button = TagButton()
        button.setupButton()
        return button
    }()
    
    var tipViewModel: TipListViewModel! {
        didSet {
            titleLabel.text = tipViewModel.title
            descriptionLabel.text = tipViewModel.description
            tipImageView.image = tipViewModel.image
            tipButton.setTitle(tipViewModel.chip, for: .normal)
            tipButton.updateButtonColor(tipViewModel.tipCategory)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(tipImageView)
        tipImageView.addAnchors(wAnchor: widthAnchor, 0.4, hAnchor: heightAnchor, 0.9, cYAnchor: centerYAnchor, rAnchor: rightAnchor, rightConstant: -12)
        addSubview(textView)
        textView.addAnchors(wAnchor: widthAnchor, 0.7, hAnchor: heightAnchor, 0.8, cYAnchor: centerYAnchor, lAnchor: leftAnchor, leftConstant: 8)
        textView.addSubview(titleLabel)
        titleLabel.addAnchors(wAnchor: textView.widthAnchor, 0.9, cXAnchor: textView.centerXAnchor, tAnchor: textView.topAnchor, topConstant: 8)
        textView.addSubview(descriptionLabel)
        descriptionLabel.addAnchors(wAnchor: titleLabel.widthAnchor, 1.0, lAnchor: textView.leftAnchor, leftConstant: 8,
                                    tAnchor: titleLabel.bottomAnchor, topConstant: 12)
        textView.addSubview(tipButton)
        tipButton.addAnchors(lAnchor: textView.leftAnchor, leftConstant: 8, tAnchor: descriptionLabel.bottomAnchor, topConstant: 8)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
