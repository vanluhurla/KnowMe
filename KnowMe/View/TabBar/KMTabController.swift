//
//  KMTabController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMTabController: UITabBarController {
    
    private let profileCoordinator: KMProfileCoordinator
    private let journeyCoordinator: KMJourneyCoordinator
    private let educationCoordinator: KMEducationCoordinator
    private let skillsCoordinator: KMSkillsCoordinator
    private let hobbiesCoordinator: KMHobbiesCoordinator
    
    init() {
        profileCoordinator = KMProfileCoordinator(navigationController: UINavigationController())
        journeyCoordinator = KMJourneyCoordinator(navigationController: UINavigationController())
        educationCoordinator = KMEducationCoordinator(navigationController: UINavigationController())
        skillsCoordinator = KMSkillsCoordinator(navigationController: UINavigationController())
        hobbiesCoordinator = KMHobbiesCoordinator(navigationController: UINavigationController())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileCoordinator.start()
        journeyCoordinator.start()
        educationCoordinator.start()
        skillsCoordinator.start()
        hobbiesCoordinator.start()
        viewControllers = [profileCoordinator.navigationController,
                           journeyCoordinator.navigationController,
                           educationCoordinator.navigationController,
                           skillsCoordinator.navigationController,
                           hobbiesCoordinator.navigationController]
    }
}
