//
//  KMProfileImageCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/12/2023.
//

import UIKit
import Lottie

class KMProfileAnimationCell: UICollectionViewCell {
    
    static var identifier = "ReusableKMProfileAnimationCell"
    
    private var profileMainAnimation = LottieAnimationView()
    
    private var profileAnimationView: UIView = {
        let view = UIView()
        view.autoresizingMask = [.flexibleWidth]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCellContent() {
        setupValues()
        setupUI()
    }
}

private extension KMProfileAnimationCell {
    func setupValues() {
        profileMainAnimation = .init(name: "hello")
    }
    
    func setupUI() {
        setupAnimation()
        setupViews()
        layoutViews()
    }
    
    func setupAnimation() {
        profileMainAnimation.frame = contentView.bounds
        profileMainAnimation.play()
        profileMainAnimation.loopMode = .loop
    }
    
    func setupViews() {
        contentView.addSubview(profileAnimationView)
        profileAnimationView.addSubview(profileMainAnimation)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            profileAnimationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileAnimationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileAnimationView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileAnimationView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            profileMainAnimation.leadingAnchor.constraint(equalTo: profileAnimationView.leadingAnchor),
            profileMainAnimation.trailingAnchor.constraint(equalTo: profileAnimationView.trailingAnchor),
            profileMainAnimation.topAnchor.constraint(equalTo: profileAnimationView.topAnchor),
            profileMainAnimation.bottomAnchor.constraint(equalTo: profileAnimationView.bottomAnchor)
        ])
    }
}
