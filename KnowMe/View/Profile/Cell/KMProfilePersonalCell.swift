//
//  KMProfilePersonalCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 19/12/2023.
//

import UIKit

protocol KMProfileCellDelegate: AnyObject {
    func didTapReadMoreButton()
}

class KMProfilePersonalCell: UICollectionViewCell {
    
    weak var delegate: KMProfileCellDelegate?
    
    static var identifier = "ReusableKMProfilePersonalCell"
    
    private var imageSize = CGSize(width: 50, height: 50)
    private var detailsTextViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        view.layer.cornerRadius = 15
        return view
    }()
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .clear
        stackView.layer.cornerRadius = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.backgroundColor = .clear
        return imageView
    }()
    private var profileTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 2
        label.textAlignment = .justified
        return label
    }()
    private var profileTextCellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Read more", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.contentHorizontalAlignment = .right
        button.backgroundColor = .clear
        return button
    }()
    private var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(item: ProfilePersonalItem) {
        setupValues(item: item)
        setupUI()
    }
}

private extension KMProfilePersonalCell {
    func setupValues(item: ProfilePersonalItem) {
        profileTextLabel.text = item.personalInfo
        if let image = UIImage(named: item.icon),
           let scaledImage = image.resize(to: imageSize) {
            iconImageView.image = scaledImage
        }
        profileTextCellButton.addTarget(self, action: #selector(didTapReadMeButton), for: .touchUpInside)
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
        stackViewIndentation()
        textStackViewIndentation()
    }
    
    func setupViews() {
        contentView.addSubview(detailsTextViewCell)
        detailsTextViewCell.addSubview(mainStackView)
        mainStackView.addArrangedSubview(textStackView)
        mainStackView.addArrangedSubview(profileTextCellButton)
        textStackView.addArrangedSubview(iconImageView)
        textStackView.addArrangedSubview(profileTextLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            detailsTextViewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailsTextViewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailsTextViewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsTextViewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: detailsTextViewCell.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: detailsTextViewCell.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: detailsTextViewCell.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: detailsTextViewCell.bottomAnchor),
            
            textStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            textStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            
            iconImageView.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: 5),
            iconImageView.widthAnchor.constraint(equalToConstant: 70),
            iconImageView.heightAnchor.constraint(equalToConstant: 70),
            
            profileTextCellButton.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 16),
            profileTextCellButton.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -16),
            profileTextCellButton.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 16)
            
        ])
    }
    
    func stackViewIndentation() {
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16,
                                                                               leading: 16,
                                                                               bottom: 16,
                                                                               trailing: 16)
    }
    
    func textStackViewIndentation() {
        textStackView.isLayoutMarginsRelativeArrangement = true
        textStackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10,
                                                                         leading: 16,
                                                                         bottom: 0,
                                                                         trailing: 16)
    }
    
    @objc func didTapReadMeButton() {
        delegate?.didTapReadMoreButton()
    }
}

private extension UIImage {
    func resize(to size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

                                        

