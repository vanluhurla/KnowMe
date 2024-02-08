//
//  KMProfileHeader.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 18/12/2023.
//

import UIKit

class KMProfileHeader: UICollectionReusableView {
    
    static var identifier = "ReusableKMProfileHeader"
    
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
    private var profileHeaderTitleLabel: UILabel = {
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

private extension KMProfileHeader {
    func setupValues(title: String) {
        profileHeaderTitleLabel.text = title
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        addSubview(headerCellView)
        headerCellView.addSubview(headerCellStackView)
        headerCellStackView.addArrangedSubview(profileHeaderTitleLabel)
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
                    


