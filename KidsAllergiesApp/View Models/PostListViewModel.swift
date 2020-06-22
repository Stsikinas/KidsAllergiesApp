//
//  PostListViewModel.swift
//  KidsAllergiesApp
//
//  Created by Epsilon User on 17/6/20.
//  Copyright © 2020 Stavros Team. All rights reserved.
//

import Foundation
import UIKit

public struct PostListViewModel {
    
    // MARK: Variables
    var postText: String
    var author: String
    var postDate: String
    var favourites: Int
    var comments: Int
    var image: UIImage
    
    init(post: Post) {
        postDate = ""
        postText = post.postText
        author = post.editor
        favourites = post.likesNum
        comments = post.commentsNum
        image = post.placeholderImage
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
    
}
