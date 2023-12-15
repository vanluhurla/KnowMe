//
//  KMViewControllerFactory.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMViewControllerFactory {
    
    func profileViewController() -> UIViewController {
        let viewModel = KMProfileViewModel()
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
        let viewModel = KMHobbiesViewModel()
        let viewController = KMHobbiesViewController(viewModel: viewModel)
        return viewController
    }
}
