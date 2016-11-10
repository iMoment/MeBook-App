//
//  Post.swift
//  MeBook
//
//  Created by Stanley Pan on 10/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class Post {
    var name: String?
    var profileImageName: String?
    var statusText: String?
    var statusImageName: String?
    var numLikes: Int?
    var numComments: Int?
    
    var statusImageUrl: String?
}

class Posts {
    
    private let postList: [Post]
    
    init() {
        let postMark = Post()
        postMark.name = "Mark Zuckerberg"
        postMark.profileImageName = "zuckprofile"
        postMark.statusText = "By giving people the power to share, we're making the world more transparent."
        postMark.statusImageName = "zuckdog"
        postMark.numLikes = 400
        postMark.numComments = 123
        postMark.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/mark_zuckerberg_background.jpg"
        
        
        let postSteve = Post()
        postSteve.name = "Steve Jobs"
        postSteve.profileImageName = "steve_profile"
        postSteve.statusText = "Design is not just what it looks like and feels like. Design is how it works. \n\n" +
            "Being the richest man in the cemetery doesn't matter to me. Going to bed at night saying we've done something wonderful, that's what matters to me. \n\n" +
        "Sometimes when you innovate, you make mistakes. It is best to admit them quickly, and get on with improving your other innovations."
        postSteve.statusImageName = "steve_status"
        postSteve.numLikes = 1000
        postSteve.numComments = 55
        postSteve.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/steve_jobs_background.jpg"
        
        let postGandhi = Post()
        postGandhi.name = "Mahatma Gandhi"
        postGandhi.profileImageName = "gandhi"
        postGandhi.statusText = "Live as if you were to die tomorrow; learn as if you were to live forever. \n\n" +
            "The weak can never forgive. Forgiveness is the attribute of the strong. \n" +
        "Happiness is when what you think, what you say, and what you do are in harmony."
        postGandhi.statusImageName = "gandhi_status"
        postGandhi.numLikes = 333
        postGandhi.numComments = 22
        postGandhi.statusImageUrl = "https://s3-us-west-2.amazonaws.com/letsbuildthatapp/gandhi_status.jpg"
        
        postList = [postMark, postSteve, postGandhi]
    }
    
    func numberOfPosts() -> Int {
        return postList.count
    }
    
    subscript(indexPath: IndexPath) -> Post {
        get {
            return postList[indexPath.item]
        }
    }
}



















