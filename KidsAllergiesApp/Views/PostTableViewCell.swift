//
//  PostTableViewCell.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 17/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    // MARK: Subview Initializers
    lazy var postView: UIView = {
       let view = UIView()
        view.backgroundColor = .lightBeige
        view.cardView(ofRadius: 12.0, withShadow: UIColor.gray)
        return view
    }()
    lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "AmericanTypewriter", size: 14.0)
        return label
    }()
    lazy var postDate: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "AmericanTypewriter", size: 13.0)
        label.textAlignment = .left
        return label
    }()
    lazy var favouriteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.set(color: .darkGray, forImage: UIImage(named: "no_fav.png")!)
        button.isEnabled = false
        return button
    }()
    lazy var favouriteLabel: UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir-Book", size: 13.0)
        return label
    }()
    lazy var seperator: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 32))
        view.backgroundColor = .darkGray
        return view
    }()
    lazy var commentButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.set(color: .darkGray, forImage: UIImage(named: "comments.png")!)
        button.isEnabled = false
        return button
    }()
    lazy var commentLabel: UILabel = {
       let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont(name: "Avenir-Book", size: 13.0)
        return label
    }()
    lazy var postTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Avenir-Book", size: 16.0)
        label.numberOfLines = 3
         return label
    }()
    lazy var postCommentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Add new comment..."
        textField.delegate = self
        textField.keyboardType = .default
        textField.returnKeyType = .send
        textField.autocorrectionType = .no
        textField.font = UIFont.systemFont(ofSize: 13.0)
        textField.borderStyle = .roundedRect
        return textField
    }()
    lazy var commentPostedLabel: UILabel = {
        let label = UILabel()
        let approvedImage = UIImage(named: "approved_comment")
        label.set(text: "Your comment has been added!", withImage: UIImage(named: "approved_comment")!)
        label.textColor = .white
        label.backgroundColor = AppUtility().primaryColor.withAlphaComponent(0.6)
        return label
    }()
    
    // MARK: Use VM to update cell UI
    var postListViewModel: PostListViewModel! {
        didSet {
            authorLabel.text = postListViewModel.author
            postDate.text = postListViewModel.postDate
            postTextLabel.text = postListViewModel.postText
            favouriteLabel.text = postListViewModel.favouritesText
            commentLabel.text = postListViewModel.commentsText
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
        
        postView.addSubview(favouriteButton)
        favouriteButton.addAnchors(tAnchor: postView.topAnchor, topConstant: 12)
        postView.addSubview(favouriteLabel)
        favouriteLabel.addAnchors(cYAnchor: favouriteButton.centerYAnchor, lAnchor: favouriteButton.rightAnchor, leftConstant: 5, tAnchor: postView.topAnchor, topConstant: 12)
        postView.addSubview(commentButton)
        commentButton.addAnchors(lAnchor: favouriteLabel.rightAnchor, leftConstant: 12, tAnchor: postView.topAnchor, topConstant: 12)
        postView.addSubview(commentLabel)
        commentLabel.addAnchors(cYAnchor: commentButton.centerYAnchor, lAnchor: commentButton.rightAnchor, leftConstant: 5, tAnchor: postView.topAnchor, topConstant: 12, rAnchor: postView.rightAnchor, rightConstant: -12)
        postView.addSubview(postTextLabel)
        postTextLabel.addAnchors(cXAnchor: postView.centerXAnchor, lAnchor: postView.leftAnchor, leftConstant: 12, tAnchor: postDate.bottomAnchor, topConstant: 12)
        postView.addSubview(postCommentTextField)
        postCommentTextField.addAnchors(wAnchor: postView.widthAnchor, 0.95, cXAnchor: postView.centerXAnchor, tAnchor: postTextLabel.bottomAnchor, topConstant: 12, bAnchor: postView.bottomAnchor, bottomConstant: -12)
        postView.addSubview(commentPostedLabel)
        commentPostedLabel.addAnchors(wAnchor: postView.widthAnchor, 0.95, cXAnchor: postView.centerXAnchor, tAnchor: postTextLabel.bottomAnchor, topConstant: 12, bAnchor: postView.bottomAnchor, bottomConstant: -12)
        commentPostedLabel.isHidden = true
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    // MARK: Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {
            return true
        }
        if !text.isEmpty {
            textField.resignFirstResponder()
            animateNewComment(textField: textField)
            return false
        }
        return true
    }
    
    // MARK: Animations
    /// Animate new comment sequence (preffered from fadeIn/Out of extension, to avoid many {})
    private func animateNewComment(textField: UITextField) {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5, animations: {
                textField.alpha = 0.0
            })
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                self.commentPostedLabel.alpha = 1.0
            })
        }, completion: { _ in
            textField.text = nil
            textField.isHidden = true
            self.commentPostedLabel.isHidden = false
            self.postListViewModel.addComment()
        })
    }
    
}
