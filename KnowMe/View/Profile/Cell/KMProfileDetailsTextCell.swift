//
//  KMProfileDetailsTextCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 19/12/2023.
//

import UIKit

class KMProfileDetailsTextCell: UICollectionViewCell {
    
    static var identifier = "ReusableKMProfileDetailsTextCell"
    
    private var detailsTextViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 15
        return view
    }()
    private var detailsTextStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var profileTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    private var profileTextCellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Read more", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(text: String) {
        setupValues(text: text)
        setupUI()
    }
}

private extension KMProfileDetailsTextCell {
    func setupValues(text: String) {
        profileTextLabel.text = text
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
        stackViewIndentation()
    }
    
    func setupViews() {
        contentView.addSubview(detailsTextViewCell)
        detailsTextViewCell.addSubview(detailsTextStackView)
        detailsTextStackView.addArrangedSubview(profileTextLabel)
        detailsTextStackView.addArrangedSubview(profileTextCellButton)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            detailsTextViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsTextViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsTextViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsTextViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            detailsTextStackView.leadingAnchor.constraint(equalTo: detailsTextViewCell.leadingAnchor),
            detailsTextStackView.trailingAnchor.constraint(equalTo: detailsTextViewCell.trailingAnchor),
            detailsTextStackView.topAnchor.constraint(equalTo: detailsTextViewCell.topAnchor),
            detailsTextStackView.bottomAnchor.constraint(equalTo: detailsTextViewCell.bottomAnchor),
            
//            profileTextCellButton.trailingAnchor.constraint(equalTo: detailsTextStackView.trailingAnchor, constant: -10),
//            profileTextCellButton.bottomAnchor.constraint(equalTo: detailsTextStackView.bottomAnchor, constant: -10)

        ])
    }
    
    func stackViewIndentation() {
        detailsTextStackView.isLayoutMarginsRelativeArrangement = true
        detailsTextStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
                                                                               leading: 16,
                                                                               bottom: 16,
                                                                               trailing: 16)
    }
}
                                        

