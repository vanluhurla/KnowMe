//
//  KMProfileContentCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 19/12/2023.
//

import UIKit

protocol KMProfileCellDelegate: AnyObject {
    func didTapReadMoreButton(type: ProfileContentType)
}

class KMProfileContentCell: UICollectionViewCell {
    static var identifier = "ReusableKMProfileContentCell"
    
    private var detailsTextViewCell: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .backgroundDetails
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
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .clear
        return imageView
    }()
    private var profileTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.textColor = .mainText
        label.numberOfLines = 2
        label.textAlignment = .natural
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
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var contentType: ProfileContentType?
    
    weak var delegate: KMProfileCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(item: ProfileContent) {
        contentType = item.type
        setupValues(item: item)
        setupUI()
    }
}

private extension KMProfileContentCell {
    func setupValues(item: ProfileContent) {
        profileTextLabel.text = item.info
        iconImageView.image = UIImage(named: item.icon)

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
            
            textStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 10),
            textStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: 10),
            
            
            iconImageView.leadingAnchor.constraint(equalTo: textStackView.leadingAnchor, constant: 0),
            iconImageView.widthAnchor.constraint(equalToConstant: 60),
            iconImageView.heightAnchor.constraint(equalToConstant: 60),
            
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
        guard let contentType else {
            return
        }
        delegate?.didTapReadMoreButton(type: contentType)
    }
}

//private extension UIImage {
//    func resize(to size: CGSize) -> UIImage? {
//        let renderer = UIGraphicsImageRenderer(size: size)
//        return renderer.image { _ in
//            self.draw(in: CGRect(origin: .zero, size: size))
//        }
//    }
//}



