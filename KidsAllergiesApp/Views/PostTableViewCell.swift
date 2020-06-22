//
//  PostTableViewCell.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 17/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: Subview Initializers
    var postView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightBeige
        view.cardView(ofRadius: 12.0, withShadow: UIColor.gray)
        return view
    }()
    var postImage: UIImageView = {
       let imageView = UIImageView()
       imageView.contentMode = .scaleToFill
        return imageView
    }()
    var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AmericanTypewriter", size: 14.0)
        return label
    }()
    var postDate: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "AmericanTypewriter", size: 13.0)
        label.textAlignment = .left
        return label
    }()
    var favouriteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.set(color: .darkGray, forImage: UIImage(named: "no_fav.png")!)
        button.isEnabled = false
        return button
    }()
    var favouriteLabel: UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir-Book", size: 13.0)
        return label
    }()
    var seperator: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 32))
        view.backgroundColor = .darkGray
        return view
    }()
    var commentButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.set(color: .darkGray, forImage: UIImage(named: "comments.png")!)
        button.isEnabled = false
        return button
    }()
    var commentLabel: UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir-Book", size: 13.0)
        return label
    }()
    var postTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Book", size: 16.0)
        label.numberOfLines = 3
         return label
    }()
    
    // MARK: Use VM to update cell UI
    var postListViewModel: PostListViewModel! {
        didSet {
            postImage.image = postListViewModel.image
            authorLabel.text = postListViewModel.author
            postDate.text = postListViewModel.postDate
            postTextLabel.text = postListViewModel.postText
            favouriteLabel.text = String(postListViewModel.favourites)
            commentLabel.text = String(postListViewModel.comments)
        }
    }
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(postView)
        postView.addAnchors(wAnchor: widthAnchor, 0.9, hAnchor: heightAnchor, 0.9, cXAnchor: centerXAnchor, cYAnchor: centerYAnchor)
        postView.addSubview(authorLabel)
        authorLabel.addAnchors(lAnchor: postView.leftAnchor, leftConstant: 12, tAnchor: postView.topAnchor, topConstant: 10)
        postView.addSubview(postDate)
        postDate.addAnchors(lAnchor: postView.leftAnchor, leftConstant: 12, tAnchor: authorLabel.bottomAnchor, topConstant: 3)
        postView.addSubview(postTextLabel)
        postTextLabel.addAnchors(cXAnchor: postView.centerXAnchor, lAnchor: postView.leftAnchor, leftConstant: 12, tAnchor: postDate.bottomAnchor, topConstant: 12)
        postView.addSubview(favouriteButton)
        favouriteButton.addAnchors(tAnchor: postView.topAnchor, topConstant: 12)
        postView.addSubview(favouriteLabel)
        favouriteLabel.addAnchors(cYAnchor: favouriteButton.centerYAnchor, lAnchor: favouriteButton.rightAnchor, leftConstant: 5, tAnchor: postView.topAnchor, topConstant: 12)
        postView.addSubview(commentButton)
        commentButton.addAnchors(lAnchor: favouriteLabel.rightAnchor, leftConstant: 12, tAnchor: postView.topAnchor, topConstant: 12)
        postView.addSubview(commentLabel)
        commentLabel.addAnchors(cYAnchor: commentButton.centerYAnchor, lAnchor: commentButton.rightAnchor, leftConstant: 5, tAnchor: postView.topAnchor, topConstant: 12, rAnchor: postView.rightAnchor, rightConstant: -12)
        postView.addSubview(postImage)
        postImage.addAnchors(wAnchor: postView.widthAnchor, 0.9, cXAnchor: postView.centerXAnchor, tAnchor: postTextLabel.bottomAnchor, topConstant: 15, bAnchor: postView.bottomAnchor, bottomConstant: 2)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
