//
//  KMProfileImageCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/12/2023.
//

import UIKit

class KMProfileImageCell: UICollectionViewCell {
    
    static var identifier = "ReusableKMProfileImageCell"
    
    private var profileView: UIView = {
        let view = UIView()
        view.autoresizingMask = [.flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        return view
    }()
    private var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent() {
        setupUI()
        setupValues()
    }
}

private extension KMProfileImageCell {
    func setupValues() {
        profileImageView.image = UIImage(named: "vanessa_profile")
    }
    
    func setupUI() {
        setupViews()
        layoutViews()
    }
    
    func setupViews() {
        contentView.addSubview(profileView)
        profileView.addSubview(profileImageView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            profileImageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor),
            profileImageView.trailingAnchor.constraint(equalTo: profileView.trailingAnchor),
            profileImageView.topAnchor.constraint(equalTo: profileView.topAnchor),
            profileImageView.bottomAnchor.constraint(equalTo: profileView.bottomAnchor)
        ])
    }
}
