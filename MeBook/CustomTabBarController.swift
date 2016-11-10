//
//  CustomTabBarController.swift
//  MeBook
//
//  Created by Stanley Pan on 10/11/2016.
//  Copyright © 2016 Stanley Pan. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        
        viewControllers = [navigationController]
    }
}
