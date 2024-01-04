//
//  KMViewControllerFactory.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMViewControllerFactory {
    
    func profileViewController(coordinator: KMProfileViewModelCoordinator) -> UIViewController {
        let viewModel = KMProfileViewModel(coordinator: coordinator)
        let detailsViewController = KMProfileDetailsViewController()
        let viewController = KMProfileViewController(viewModel: viewModel, detailsViewController: detailsViewController)
        return viewController
    }
    
    func journeyViewController() -> UIViewController {
        let viewModel = KMJourneyViewModel()
        let viewController = KMJourneyViewController(viewModel: viewModel)
        return viewController
    }
    
    func educationViewController() -> UIViewController {
        let viewModel = KMEducationViewModel()
        let viewController = KMEducationViewController(viewModel: viewModel)
        return viewController
    }
    
    func skillsViewController() -> UIViewController {
        let viewModel = KMSkillsViewModel()
        let viewController = KMSkillsViewController(viewModel: viewModel)
        return viewController
    }
    
    func hobbiesViewController() -> UIViewController {
        let viewModel = KMContactViewModel()
        let viewController = KMContactViewController(viewModel: viewModel)
        return viewController
    }
    
    func profileDetailsViewController() -> UINavigationController {
        let detailsViewController = KMProfileDetailsViewController()
        let navController = UINavigationController(rootViewController: detailsViewController)
        
        if let sheet = navController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        return navController
    }
}



