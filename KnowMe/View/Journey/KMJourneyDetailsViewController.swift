//
//  KMJourneyDetailsViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 27/02/2024.
//

import UIKit

class KMJourneyDetailsViewController: UIViewController {
    
    
    private var mainScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        return imageView
    }()
    private var detailsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.textColor = .black
        label.textAlignment = .natural
        return label
    }()
    
    let viewModel: KMJourneyDetailsViewModel
    
    init(viewModel: KMJourneyDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundPrimary
        viewModel.loadData()
        setupUI()
    }
}
extension KMJourneyDetailsViewController: KMJourneyDetailsViewModelDelegate {
    func didReceiveContent(content: CardContent) {
        detailsTextLabel.text = content.content
        iconImageView.image = UIImage(named: content.icon)
    }
}

extension KMJourneyDetailsViewController {
    func setupUI() {
        setupViews()
        layoutViews()
        stackViewIndentation()
    }
    
    func setupViews() {
        view.addSubview(mainScrollView)
        mainScrollView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(iconImageView)
        mainStackView.addArrangedSubview(detailsTextLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            mainScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: mainScrollView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: mainScrollView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: mainScrollView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: mainScrollView.bottomAnchor),
            mainStackView.widthAnchor.constraint(equalTo: mainScrollView.widthAnchor),
            
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            iconImageView.heightAnchor.constraint(equalToConstant: 100),
            iconImageView.centerXAnchor.constraint(equalTo: mainStackView.centerXAnchor),
            iconImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 50)
        ])
    }
    
    func stackViewIndentation() {
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
                                                                         leading: 16,
                                                                         bottom: 16,
                                                                         trailing: 16)
    }
}
