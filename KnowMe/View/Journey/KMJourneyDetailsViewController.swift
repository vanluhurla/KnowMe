//
//  KMJourneyDetailsViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 27/02/2024.
//

import UIKit

class vKMJourneyDetailsViewController: UIViewController {
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var detailsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .natural
        return label
    }()
    
    let viewModel: KMJourneyDetailsViewModel
    
    init(viewModel: KMJourneyDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        viewModel.loadData()
    }
}

