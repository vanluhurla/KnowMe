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
    
    private var profileMainAnimation: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
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
        profileMainAnimation.animation = LottieAnimation.named("hello")
    }
    
    func setupUI() {
        setupAnimation()
        setupViews()
        layoutViews()
    }
    
    func setupAnimation() {
        profileMainAnimation.play()
        
    }
    
    func setupViews() {
        contentView.addSubview(profileMainAnimation)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            profileMainAnimation.widthAnchor.constraint(equalToConstant: 400),
            profileMainAnimation.heightAnchor.constraint(equalToConstant: 400),
            profileMainAnimation.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            profileMainAnimation.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -50)
        ])
    }
}
