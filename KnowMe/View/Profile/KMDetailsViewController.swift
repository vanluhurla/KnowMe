//
//  KMDetailsViewController.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 12/12/2023.
//

import UIKit
import Lottie

class KMDetailsViewController: UIViewController {
    
    private var animationView = LottieAnimationView()
    
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
        view.backgroundColor = .personalCellColour
        viewModel.loadData()
        setupUI()
    }
}

extension KMDetailsViewController: KMGenericBottomSheetDelegate {
    func didReceiveContent(text: String, animation: String, type: ProfileContentType) {
        detailsTextLabel.text = text
        
        switch type {
        case .personal:
            view.backgroundColor = .personalCellColour
            detailsTextLabel.textColor = .white
            animationView = .init(name: "personal-animation")
        case .professional:
            view.backgroundColor = .professionalCellColour
            detailsTextLabel.textColor = .white
            animationView = .init(name: "professional-animation")
        }
    }
}

extension KMDetailsViewController {
    func setupUI() {
        setupViews()
        setupLayout()
        stackViewIndentation()
        setupAnimation()
    }
    
    func setupAnimation(){
        animationView.frame = view.bounds
        animationView.play()
        animationView.loopMode = .loop
    }
    
    func setupViews() {
        view.addSubview(mainStackView)
        mainStackView.addArrangedSubview(animationView)
        mainStackView.addArrangedSubview(detailsTextLabel)
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: view.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            animationView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 0),
            animationView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 80),
            animationView.widthAnchor.constraint(equalToConstant: 200),
            animationView.heightAnchor.constraint(equalToConstant: 200)
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
