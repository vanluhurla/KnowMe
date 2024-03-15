//
//  KMEducationAnimationCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/03/2024.
//

import UIKit
import Lottie

class KMEducationAnimationCell: UICollectionViewCell {
    
    static var identifier = "ReusableKMEducationAnimationCell"
    
    private var educationAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView()
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        animationView.alpha = 0.6
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

extension KMEducationAnimationCell {
    func setupValues() {
        educationAnimationView.animation = LottieAnimation.named("education")
    }
    
    func setupUI() {
        setupAnimation()
        setupViews()
        layoutViews()
    }
    
    func setupAnimation() {
        educationAnimationView.play()
    }
    
    func setupViews() {
        contentView.addSubview(educationAnimationView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            educationAnimationView.widthAnchor.constraint(equalToConstant: 300),
            educationAnimationView.heightAnchor.constraint(equalToConstant: 300),
            educationAnimationView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            educationAnimationView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -30)
        ])
    }
}
