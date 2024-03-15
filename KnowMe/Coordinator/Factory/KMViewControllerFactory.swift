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
        let viewController = KMProfileViewController(viewModel: viewModel)
        return viewController
    }
    
    func journeyViewController(coordinator: KMJourneyViewModelCoordinator) -> UIViewController {
        let viewModel = KMJourneyViewModel(coordinator: coordinator)
        let viewController = KMJourneyViewController(viewModel: viewModel)
        return viewController
    }
    
    func educationViewController(coordinator: KMEducationViewModelCoordinator) -> UIViewController {
        let viewModel = KMEducationViewModel(coordinator: coordinator)
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
    
    func profileDetailsBottomSheet(configuration: KMGenericBottomSheetConfiguration) -> UINavigationController {
        let viewModel = KMDetailsViewModel(configuration: configuration)
        let detailsViewController = KMDetailsViewController(viewModel: viewModel)
        let navController = UINavigationController(rootViewController: detailsViewController)
        
        if let sheet = navController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
        }
        return navController
    }
    
    func journeyDetailsViewController (configuration: KMJourneyDetailsViewModelConfiguration) -> UIViewController {
        let viewModel = KMJourneyDetailsViewModel(configuration: configuration)
        let journeyDetailsViewController = KMJourneyDetailsViewController(viewModel: viewModel)
        return journeyDetailsViewController
    }
    
    func educationDetailsViewController (configuration: KMEducationDetailsViewModelConfiguration) -> UIViewController {
        let viewModel = KMEducationDetailsViewModel(configuration: configuration)
        let educationDetailsViewController = KMEducationDetailsViewController(viewModel: viewModel)
        return educationDetailsViewController
    }
}



