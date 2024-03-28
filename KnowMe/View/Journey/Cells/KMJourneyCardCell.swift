//
//  KMJourneyCardCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 19/02/2024.
//

import UIKit

class KMJourneyCardCell: UICollectionViewCell {
    
    static var identifier = "ReusableKMJourneyContentCell"
    
    private var cardView: UIView = {
        let view = UIView()
        view.autoresizingMask = [.flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private var textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.layoutMargins = UIEdgeInsets(top: 14, left: 0, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainText
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent(item: JourneyCard) {
        setupUI()
        setupValues(item: item)
    }
}

private extension KMJourneyCardCell {
    func setupValues(item: JourneyCard) {
        cardImageView.image = UIImage(named: item.image)
        titleLabel.text = item.title
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        contentView.addSubview(cardView)
        cardView.addSubview(mainStackView)
        mainStackView.addArrangedSubview(cardImageView)
        mainStackView.addArrangedSubview(footerView)
        footerView.addSubview(textStackView)
        textStackView.addArrangedSubview(titleLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: cardView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            
            cardImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            cardImageView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            cardImageView.topAnchor.constraint(equalTo: cardView.topAnchor),
            NSLayoutConstraint(item: cardImageView, 
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: cardImageView,
                               attribute: .width,
                               multiplier: 0.7,
                               constant: 0.0),
            
            textStackView.leadingAnchor.constraint(equalTo: footerView.leadingAnchor),
            textStackView.trailingAnchor.constraint(equalTo: footerView.trailingAnchor),
            textStackView.topAnchor.constraint(equalTo: footerView.topAnchor)
        ])
    }
}
