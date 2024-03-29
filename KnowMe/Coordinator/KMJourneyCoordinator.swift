//
//  KMJourneyCoordinator.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMJourneyCoordinator {
    
    let navigationController: UINavigationController
    let tab = KMTab.journey
    private let viewFactory = KMViewControllerFactory()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(viewFactory.journeyViewController(coordinator: self), animated: false)
        setupTab()
    }
    
    func setupTab() {
        navigationController.tabBarItem = UITabBarItem(title: tab.title,
                                                       image: tab.icon,
                                                       tag: tab.rawValue)
    }
}

extension KMJourneyCoordinator: KMJourneyViewModelCoordinator {
    func presentJourneyDetails(with configuration: KMJourneyDetailsViewModelConfiguration) {
        let viewController = viewFactory.journeyDetailsViewController(configuration: configuration)
        navigationController.pushViewController(viewController, animated: true)
    }
}
