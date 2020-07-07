//
//  AddNewPostViewController.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 1/7/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import UIKit

protocol newPostReceivedDelegate {
    func received(post: Post)
}

class AddNewPostViewController: UIViewController, textViewValueChangedDelegate {
    
    
    var delegate: newPostReceivedDelegate?
    
    private var shareBtn = UIBarButtonItem()
    private var postText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelView))
        shareBtn = UIBarButtonItem(title: "Share", style: .done, target: self, action: #selector(addPost))
        addNavigationBar(rightBarButton: shareBtn, leftBarButton: cancelBtn, title: "Add New Post")
        shareBtn.isEnabled = false
        
        setupView()
        hideKeyboardTap()
    }
    
    // MARK: Setup Methods
    private func setupView() {
        let detailView = AddNewPostView(frame: view.frame)
        detailView.userViewModel = UserViewModel(user: AccountHelper.shared.getRegisteredUser() ??
            User(name: "", surname: "", username: "", password: ""))
        view.addSubview(detailView)
        detailView.delegate = self
    }
    
    
    // MARK: Obj-C Methods
    @objc private func addPost() {
        if let delegate = delegate {
            dismiss(animated: true, completion: nil)
            if let user = AccountHelper.shared.getRegisteredUser() {
                delegate.received(post: Post(postText: postText, editor: TextUtils.shared.concat(values: [user.name, user.surname]), commentsNum: 0, likesNum: 0, date: Date(timeIntervalSinceNow: -1)))
            }
        }
    }
    
    // MARK: Delegate Methods
    func textValueChanged(of textView: UITextView, textCount: Int) {
        postText = textView.text
        shareBtn.isEnabled = !textView.text.isEmpty && textCount <= wordCount
    }
}
