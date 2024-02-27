//
//  KMJourneyHeader.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 27/02/2024.
//

import UIKit

class KMJourneyHeader: UICollectionReusableView {
    
    static var identifier = "ReusableKMJourneyHeader"
    
    private var headerCellView: UIView = {
        let view =  UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private var headerCellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 2.0
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var journeyHeaderTitleLabel: UILabel = {
        let header = UILabel()
        header.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        header.textColor = .mainText
        return header
    }()
    
    func setupHeader(title: String) {
        setupValues(title: title)
        setupUI()
    }
}

private extension KMJourneyHeader {
    func setupValues(title: String) {
        journeyHeaderTitleLabel.text = title
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        addSubview(headerCellView)
        headerCellView.addSubview(headerCellStackView)
        headerCellStackView.addArrangedSubview(journeyHeaderTitleLabel)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            headerCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerCellView.topAnchor.constraint(equalTo: topAnchor),
            headerCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerCellStackView.leadingAnchor.constraint(equalTo: headerCellView.leadingAnchor),
            headerCellStackView.trailingAnchor.constraint(equalTo: headerCellView.trailingAnchor),
            headerCellStackView.topAnchor.constraint(equalTo: headerCellView.topAnchor),
            headerCellStackView.bottomAnchor.constraint(equalTo: headerCellView.bottomAnchor)
        ])
    }
}
