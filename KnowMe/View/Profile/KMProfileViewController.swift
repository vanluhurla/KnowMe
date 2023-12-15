//
//  KMProfileViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMProfileViewController: UIViewController {
    
    let viewModel: KMProfileViewModel
    let detailsViewController: KMProfileDetailsViewController

    init(viewModel: KMProfileViewModel, detailsViewController: KMProfileDetailsViewController) {
        self.viewModel = viewModel
        self.detailsViewController = detailsViewController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        profileDetailsViewController()
    }
    
    @objc func profileDetailsViewController() {
        let detailsviewController = KMProfileDetailsViewController()

        if let sheet = detailsviewController.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 30
            sheet.prefersGrabberVisible = true
        }
        present(detailsviewController, animated: true, completion: nil)
    }
    
//    private func profileDetailsViewController() {
//        let detailsViewController = KMProfileDetailsViewController()
//        let navController = UINavigationController(rootViewController: detailsViewController)
//        
//        if let sheet = navController.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//        }
//        present(detailsViewController, animated: true, completion: nil)
//}
}

