//
//  AddNewPostView.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 2/7/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

/// Protocol to update bar button item, based on textview value
protocol textViewValueChangedDelegate {
    func textValueChanged(of textView: UITextView, textCount: Int)
}
    
class AddNewPostView: UIView, UITextViewDelegate {
    
    var delegate: textViewValueChangedDelegate?
    
    // MARK: Subview Initializers
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    lazy var postTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "AmericanTypewriter", size: 14.0)
        textView.text = "What's on your mind?"
        textView.textColor = .lightGray
        return textView
    }()
    lazy var wordCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: "AmericanTypewriter", size: 14.0)
        label.text = "0 / \(wordCount)"
        return label
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
        }
    }
    
    // MARK: Class Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(avatarImageView)
        avatarImageView.addAnchors(lAnchor: leftAnchor, leftConstant: 12, tAnchor: topAnchor, topConstant: 60)
        addSubview(postTextView)
        postTextView.addAnchors(wAnchor: widthAnchor, 0.85, hAnchor: heightAnchor, 0.6, cXAnchor: centerXAnchor, tAnchor: avatarImageView.bottomAnchor, topConstant: 15)
        postTextView.delegate = self
        addSubview(wordCountLabel)
        wordCountLabel.addAnchors(rAnchor: rightAnchor, rightConstant: -40, bAnchor: postTextView.topAnchor, bottomConstant: -15)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: Delegate Methods
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        wordCountLabel.text = "\(getTextCount()) / \(wordCount)"
        if getTextCount() > wordCount {
            wordCountLabel.textColor = .red
        } else if getTextCount() > wordCount - 20 {
            wordCountLabel.textColor = .orange
        } else {
            wordCountLabel.textColor = .lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if let delegate = delegate {
            delegate.textValueChanged(of: textView, textCount: getTextCount())
        }
    }
    
    // MARK: Getters
    private func getTextCount() -> Int {
        return postTextView.text.count
    }
}
