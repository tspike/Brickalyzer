//
//  RootViewController.swift
//  Brickalyzer
//
//  Created by Tres Spicher on 10/24/18.
//  Copyright © 2018 Spike Software. All rights reserved.
//

import Foundation
import UIKit

class RootViewController: UITabBarController {
    var viewControllerList: [UIViewController] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        viewControllerList.append(homeViewController)
        viewControllers = viewControllerList.map {
            return UINavigationController(rootViewController: $0)
        }
    }
}
