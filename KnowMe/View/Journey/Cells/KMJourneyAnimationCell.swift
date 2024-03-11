//
//  KMJourneyAnimationCell.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/02/2024.
//

import UIKit
import Lottie

class KMJourneyAnimationCell: UICollectionViewCell {
    
    static var identifier = "ReusableKMJourneyAnimationCell"
    
    private var animationView: LottieAnimationView = {
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

extension KMJourneyAnimationCell {
    func setupValues() {
        animationView.animation = LottieAnimation.named("journey-main")
    }
    
    func setupUI() {
        setupAnimation()
        setupViews()
        layoutViews()
    }
    
    func setupAnimation() {
        animationView.play()
    }
    
    func setupViews() {
        contentView.addSubview(animationView)
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalToConstant: 300),
            animationView.heightAnchor.constraint(equalToConstant: 300),
            animationView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            animationView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -30)
        ])
    }
}
