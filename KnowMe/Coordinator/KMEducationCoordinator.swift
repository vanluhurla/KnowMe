//
//  KMEducationCoordinator.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMEducationCoordinator {
    
    let navigationController: UINavigationController
    let tab = KMTab.education
    private let viewFactory = KMViewControllerFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(viewFactory.educationViewController(coordinator: self), animated: false)
        setupTab()
    }
    
    func setupTab() {
        navigationController.tabBarItem = UITabBarItem(title: tab.title,
                                                       image: tab.icon,
                                                       tag: tab.rawValue)
    }
}

extension KMEducationCoordinator: KMEducationViewModelCoordinator {
    func presentEducationDetails(with configuration: KMEducationDetailsViewModelConfiguration) {
        let viewController = viewFactory.educationDetailsViewController(configuration: configuration)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    
}
