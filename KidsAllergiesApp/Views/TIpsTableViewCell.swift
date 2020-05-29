//
//  TipsTableViewCell.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 29/5/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class TipsTableViewCell: UITableViewCell {

    var textView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.cardView(ofRadius: 12.0, withShadow: UIColor.gray)
        return view
    }()
    var titleLabel: UILabel
    var descriptionLabel: UILabel
    var tipImageView: UIImageView
    var category: UIButton
    
    var tipViewModel: TipViewModel! {
        didSet {
            titleLabel.text = tipViewModel.title
            descriptionLabel.text = tipViewModel.description
            tipImageView.image = tipViewModel.image
            category.titleLabel?.text = tipViewModel.chip
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(textView)
        textView.makeEqual(1.0, 1.0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}
