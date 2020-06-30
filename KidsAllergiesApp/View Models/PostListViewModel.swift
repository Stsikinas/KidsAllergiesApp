//
//  PostListViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 17/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation

public struct PostListViewModel {
    
    // MARK: Variables
    var postText: String
    var author: String
    var postDate: String
    var favouritesText: String
    var favourites: Int
    var commentsText: String
    var comments: Int
    
    init(post: Post) {
        postDate = ""
        favouritesText = ""
        commentsText = ""
        postText = post.postText
        author = post.editor
        favourites = post.likesNum
        comments = post.commentsNum
        favouritesText = getCountString(fromNum: post.likesNum)
        commentsText = getCountString(fromNum: post.commentsNum)
        postDate = getTimeAgo(post.date)
    }
    
    // MARK: Conversion Methods
    private func getTimeAgo(_ fromDate: Date) -> String {
        if #available(iOS 13.0, *) {
            return fromDate.getTimeAgo()
        } else {
            return fromDate.getDeprecatedTimeAgo()
        }
    }
    
    /// Transform count to present to 99 comments (for clarity)
    private func getCountString(fromNum: Int) -> String {
        return fromNum > 99 ? "99+" : String(fromNum)
    }
    
    // MARK: Update Methods
    public mutating func addComment() {
        comments += 1
        commentsText = getCountString(fromNum: comments)
    }
    
}
