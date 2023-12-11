//
//  KMProfileCoordinator.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMProfileCoordinator {
    
    let navigationController: UINavigationController
    let tab = KMTab.profile
    private let viewFactory = KMViewControllerFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(viewFactory.profileViewController(), animated: false)
        setupTab()
    }
    
    func setupTab() {
        navigationController.tabBarItem = UITabBarItem(title: tab.title,
                                                       image: tab.icon,
                                                       tag: tab.rawValue)
    }
}
