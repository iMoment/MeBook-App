//
//  FeedCell.swift
//  MeBook
//
//  Created by Stanley Pan on 09/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

class FeedCell: UICollectionViewCell {
    
    var feedController: FeedController?
    
    func handleAnimate() {
        feedController?.animateImageView(statusImageView: statusImageView)
    }
    
    var post: Post? {
        
        didSet {
            statusImageView.image = nil
            
            if let statusImageUrl = post?.statusImageUrl {
                
                if let image = imageCache.object(forKey: statusImageUrl as AnyObject) as? UIImage {
                    statusImageView.image = image
                } else {
                    
                    URLSession.shared.dataTask(with: URL(string: statusImageUrl)!, completionHandler: { (data, response, error) in
                        
                        if error != nil {
                            print(error)
                            return
                        }
                        
                        let image = UIImage(data: data!)
                        imageCache.setObject(image!, forKey: statusImageUrl as AnyObject)
                        
                        DispatchQueue.main.async {
                            self.statusImageView.image = image
                        }
                        
                    }).resume()
                }
            }
            setupFeedCell()
        }
    }
    
    private func setupFeedCell() {
        
        if let name = post?.name {
            let attributedText = NSMutableAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
            
            attributedText.append(NSAttributedString(string: "\nDecember 18 • San Francisco • ", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12), NSForegroundColorAttributeName: UIColor.rgb(red: 155, green: 161, blue: 171)]))
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.characters.count))
            
            let attachment = NSTextAttachment()
            attachment.image = #imageLiteral(resourceName: "globe_small")
            attachment.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
            attributedText.append(NSAttributedString(attachment: attachment))
            
            nameLabel.attributedText = attributedText
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
        }
        
        if let statusText = post?.statusText {
            statusTextView.text = statusText
        }
        
        if let profileImageName = post?.profileImageName {
            profileImageView.image = UIImage(named: profileImageName)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "zuckprofile")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Meanwhile, Beast turned to the dark side."
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "zuckdog")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    
    let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "480 Likes    10.7K Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let likeButton: UIButton = FeedCell.buttonForTitle(title: "Like", imageName: "like")
    let commentButton: UIButton = FeedCell.buttonForTitle(title: "Comment", imageName: "comment")
    let shareButton: UIButton = FeedCell.buttonForTitle(title: "Share", imageName: "share")
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: imageName), for: .normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        return button
    }
    
    func setupViews() {
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(statusTextView)
        addSubview(statusImageView)
        addSubview(likesLabel)
        addSubview(dividerLineView)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        statusImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleAnimate)))
        
        // iOS9 Constraints: x, y, width, height
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 8).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        
        statusTextView.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 4).isActive = true
        statusTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 4).isActive = true
        statusTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        
        statusImageView.topAnchor.constraint(equalTo: statusTextView.bottomAnchor, constant: 4).isActive = true
        statusImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        statusImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        likesLabel.topAnchor.constraint(equalTo: statusImageView.bottomAnchor, constant: 8).isActive = true
        likesLabel.bottomAnchor.constraint(equalTo: dividerLineView.topAnchor, constant: -8).isActive = true
        likesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        dividerLineView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        dividerLineView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12).isActive = true
        dividerLineView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        dividerLineView.bottomAnchor.constraint(equalTo: likeButton.topAnchor).isActive = true
        
        likeButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        likeButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        commentButton.leftAnchor.constraint(equalTo: likeButton.rightAnchor).isActive = true
        commentButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        commentButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        shareButton.leftAnchor.constraint(equalTo: commentButton.rightAnchor).isActive = true
        shareButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1/3).isActive = true
        shareButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        shareButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
