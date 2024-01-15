//
//  KMProfileDetailsViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 12/12/2023.
//

import UIKit

struct KMGenericBottomSheetConfiguration {
    let text: String
}

class KMProfileDetailsViewController: UIViewController {
    

    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.backgroundColor = .clear
        return imageView
    }()
    private var detailsTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Vanessa"
        label.numberOfLines = 0
        label.textAlignment = .justified
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        func setupCellContent() {
           // viewmodel.config.text
            setupUI()
        }
    }
}

extension KMProfileDetailsViewController {
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
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
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
