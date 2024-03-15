//
//  KMEducationDetailsViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 14/03/2024.
//

import UIKit

class KMEducationDetailsViewController: UIViewController {
    
    let viewModel: KMEducationDetailsViewModel
    
    init(viewModel: KMEducationDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
    }
}
