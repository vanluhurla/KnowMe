//
//  KMEducationCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/03/2024.
//

import UIKit

protocol KMEducationCellDelegate: AnyObject {
    func didChangeSize()
}

class KMEducationCell: UICollectionViewCell {
    
    weak var delegate: KMEducationCellDelegate?
    
    static var identifier = "ReusableKMEducationCell"
    
    private var educationViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .eduCellColour
        return view
    }()
    private var mainCellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 15
//        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.backgroundColor = .clear
        iconView.clipsToBounds = true
        return iconView
    }()
    private var chevronImageView: UIImageView = {
        let chevronView = UIImageView()
        chevronView.contentMode = .scaleAspectFit
        chevronView.backgroundColor = .clear
        chevronView.clipsToBounds = true
        chevronView.tintColor = .personalCellColour
        return chevronView
    }()
    private var titleEducationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18,weight: .semibold)
        label.textColor = .eduCellText
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private var contentEducationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16,weight: .regular)
        label.textColor = .eduCellText
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
        iconImageView.image = UIImage(named: item.icon)?.withTintColor(.personalCellColour)
        chevronImageView.image = UIImage(systemName: "chevron.down")
        contentEducationLabel.isHidden = true
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
        stackViewIndentation()
        contentStackViewIndentation()
        textStackViewIndentation()
        buildGestures()
    }
    
    func setupViews() {
        contentView.addSubview(educationViewCell)
        educationViewCell.addSubview(mainCellStackView)
        mainCellStackView.addArrangedSubview(contentStackView)
        mainCellStackView.addArrangedSubview(textStackView)
        contentStackView.addArrangedSubview(iconImageView)
        contentStackView.addArrangedSubview(titleEducationLabel)
        contentStackView.addArrangedSubview(chevronImageView)
        textStackView.addArrangedSubview(contentEducationLabel)
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
            iconImageView.widthAnchor.constraint(equalToConstant: 35),
            iconImageView.heightAnchor.constraint(equalToConstant: 35),
            
            chevronImageView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -16),
            chevronImageView.widthAnchor.constraint(equalToConstant: 20),
            chevronImageView.heightAnchor.constraint(equalToConstant: 20) // Adjust trailing space as needed
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
    
    func textStackViewIndentation() {
        textStackView.isLayoutMarginsRelativeArrangement = true
        textStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: 0,
            leading: 55,
            bottom: 0,
            trailing: 30
        )
    }
    
    func buildGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        contentView.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        contentEducationLabel.isHidden.toggle()
        delegate?.didChangeSize()
        
        if contentEducationLabel.isHidden {
            chevronImageView.image = UIImage(systemName: "chevron.down") // Change to down chevron
        } else {
            chevronImageView.image = UIImage(systemName: "chevron.up") // Change to up chevron
        }
    }
}
