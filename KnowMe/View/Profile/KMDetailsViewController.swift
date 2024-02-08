//
//  KMDetailsViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 12/12/2023.
//

import UIKit

class KMDetailsViewController: UIViewController {
    
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    private var detailsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .mainText
        label.textAlignment = .natural
        return label
    }()
    
    let viewModel: KMDetailsViewModel
    
    init(viewModel: KMDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .backgroundDetails
        viewModel.loadData()
        setupUI()
        
    }
}

extension KMDetailsViewController: KMGenericBottomSheetDelegate {
    func didReceiveContent(text: String, icon: String) {
        detailsTextLabel.text = text
        iconImageView.image = UIImage(named: icon)
    }
}

extension KMDetailsViewController {
    func setupUI() {
        
        

        setupViews()
        setupLayout()
        stackViewIndentation()
    }
    
    func setupViews() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(iconImageView)
        mainStackView.addArrangedSubview(detailsTextLabel)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            iconImageView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 5),
            iconImageView.widthAnchor.constraint(equalToConstant: 70),
            iconImageView.heightAnchor.constraint(equalToConstant: 70)
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
