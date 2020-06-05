//
//  AvatarTableViewCell.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 4/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class AvatarTableViewCell: UITableViewCell {

    var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return imageView
    }()
    var userFullname: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AmericanTypewriter", size: 16.0)
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var userEmail: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AmericanTypewriter-CondensedLight", size: 14.0)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    var logoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.set(color: AppUtility().primaryColor, forImage: UIImage(named: "logout")!)
        return button
    }()
    var userButton: TagButton = {
        let button = TagButton()
        button.setupButton()
        return button
    }()
    
    var userViewModel: UserViewModel! {
        didSet {
            switch userViewModel.category {
            case UserCategory.Parent:
                avatarImageView.maskCircle(UIImage(named: "male_avatar.png")!)
                break
            default:
                avatarImageView.maskCircle(UIImage(named: "female_avatar.png")!)
                break
            }
            userFullname.text = userViewModel.fullname
            userEmail.text = userViewModel.email
            userButton.setTitle(userViewModel.userChip, for: .normal)
            userButton.updateButtonColor(userViewModel.category)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(avatarImageView)
        avatarImageView.addAnchors(lAnchor: leftAnchor, leftConstant: 8, tAnchor: topAnchor, topConstant: 8)
        
        addSubview(userFullname)
        userFullname.addAnchors(wAnchor: widthAnchor, 0.8, lAnchor: leftAnchor, leftConstant: 8,
                                tAnchor: avatarImageView.bottomAnchor, topConstant: 12)
        addSubview(userEmail)
        userEmail.addAnchors(wAnchor: widthAnchor, 0.8, lAnchor: leftAnchor, leftConstant: 8, tAnchor: userFullname.bottomAnchor, topConstant: 6)
        
        addSubview(logoutButton)
        logoutButton.addAnchors(tAnchor: topAnchor, topConstant: 22, rAnchor: rightAnchor, rightConstant: -15)
        
        addSubview(userButton)
        userButton.addAnchors(rAnchor: rightAnchor, rightConstant: -30, bAnchor: bottomAnchor, bottomConstant: -12)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
