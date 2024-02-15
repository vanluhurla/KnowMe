//
//  KMJourneyViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

class KMJourneyViewController: UIViewController {
    
    let viewModel: KMJourneyViewModel
    
    init(viewModel: KMJourneyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundPersonalCell
    }
}
