//
//  KMEducationHeader.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 26/03/2024.
//

import UIKit

class KMEducationHeader: UICollectionReusableView {
    
    static var identifier = "ReusableKMEducationHeader"
    
    private var headerCellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private var headerCellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private var educationHeaderTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .mainText
        return label
    }()
    
    func setupHeader(title: String) {
        setupValues(title: title)
        setupUI()
    }
}

private extension KMEducationHeader {
    func setupValues(title: String) {
        educationHeaderTitleLabel.text = title
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        addSubview(headerCellView)
        headerCellView.addSubview(headerCellStackView)
        headerCellStackView.addArrangedSubview(educationHeaderTitleLabel)
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
