//
//  FeedController.swift
//  MeBook
//
//  Created by Stanley Pan on 9/20/16.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class FeedController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Facebook Feed"
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
}
