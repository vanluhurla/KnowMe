//
//  KMEducationCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/03/2024.
//

import UIKit

class KMEducationCell: UICollectionViewCell {
    
    static var identifier = "ReusableKMEducationCell"
    
    private var educationViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 25
        view.backgroundColor = .backgroundPrimary
        return view
    }()
    private var mainCellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 25
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.backgroundColor = .red
        iconView.clipsToBounds = true
        return iconView
    }()
    private var titleEducationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16,weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private var contentEducationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16,weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(item: EducationCellItem) {
        setupValues(item: item)
        setupUI()
    }
}

private extension KMEducationCell {
    func setupValues(item: EducationCellItem) {
        titleEducationLabel.text = item.title
        contentEducationLabel.text = item.content
        
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
        stackViewIndentation()
        contentStackViewIndentation()
    }
    
    func setupViews() {
        contentView.addSubview(educationViewCell)
        educationViewCell.addSubview(mainCellStackView)
        mainCellStackView.addArrangedSubview(contentStackView)
        contentStackView.addArrangedSubview(iconImageView)
        contentStackView.addArrangedSubview(titleEducationLabel)
        mainCellStackView.addArrangedSubview(contentEducationLabel)

    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            educationViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            educationViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            educationViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            educationViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainCellStackView.leadingAnchor.constraint(equalTo: educationViewCell.leadingAnchor),
            mainCellStackView.trailingAnchor.constraint(equalTo: educationViewCell.trailingAnchor),
            mainCellStackView.topAnchor.constraint(equalTo: educationViewCell.topAnchor),
            mainCellStackView.bottomAnchor.constraint(equalTo: educationViewCell.bottomAnchor),
            
            contentStackView.leadingAnchor.constraint(equalTo: mainCellStackView.leadingAnchor, constant: 10),
            contentStackView.trailingAnchor.constraint(equalTo: mainCellStackView.trailingAnchor, constant: 0),
            
            iconImageView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 0),
            iconImageView.widthAnchor.constraint(equalToConstant: 45),
            iconImageView.heightAnchor.constraint(equalToConstant: 45)
        ])
        
    }
    
    func stackViewIndentation() {
        mainCellStackView.isLayoutMarginsRelativeArrangement = true
        mainCellStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 16
        )
    }
    
    func contentStackViewIndentation() {
        contentStackView.isLayoutMarginsRelativeArrangement = true
        contentStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 10,
            leading: 16,
            bottom: 10,
            trailing: 16
        )
    }
}
