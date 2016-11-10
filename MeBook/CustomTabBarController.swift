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
        tabBar.isTranslucent = false
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: feedController)
        navigationController.title = "News Feed"
        navigationController.tabBarItem.image = #imageLiteral(resourceName: "news_feed_icon")
        
        let friendRequestsController = FriendRequestsController()
        let secondNavigationController = UINavigationController(rootViewController: friendRequestsController)
        secondNavigationController.title = "Requests"
        secondNavigationController.tabBarItem.image = #imageLiteral(resourceName: "requests_icon")
        
        let messengerController = UIViewController()
        messengerController.view.backgroundColor = .white
        messengerController.navigationItem.title = "Messenger"
        let thirdNavigationController = UINavigationController(rootViewController: messengerController)
        thirdNavigationController.title = "Messenger"
        thirdNavigationController.tabBarItem.image = #imageLiteral(resourceName: "messenger_icon")
        
        let notificationController = UIViewController()
        notificationController.view.backgroundColor = .darkGray
        notificationController.navigationItem.title = "Notifications"
        let fourthNavigationController = UINavigationController(rootViewController: notificationController)
        fourthNavigationController.title = "Notifications"
        fourthNavigationController.tabBarItem.image = #imageLiteral(resourceName: "globe_icon")
        
        let profileController = UIViewController()
        profileController.view.backgroundColor = .black
        profileController.navigationItem.title = "Profile"
        let fifthNavigationController = UINavigationController(rootViewController: profileController)
        fifthNavigationController.title = "Profile"
        fifthNavigationController.tabBarItem.image = #imageLiteral(resourceName: "more_icon")
        
        viewControllers = [navigationController, secondNavigationController, thirdNavigationController,
                           fourthNavigationController, fifthNavigationController]
        
        // Height of divider line for tab bar is actually 0.5 pixels tall
        // TODO: Manually fix this
        let topDividerLine = CALayer()
        topDividerLine.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 0.5)
        topDividerLine.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        
        tabBar.layer.addSublayer(topDividerLine)
        tabBar.clipsToBounds = true
    }
}
