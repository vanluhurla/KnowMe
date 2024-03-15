//
//  KMEducationViewModel.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import Foundation

struct KMEducationViewModelConfiguration {
    let details = KMEducationDetails()
}

protocol KMEducationViewModelCoordinator: AnyObject {
    func presentEducationDetails(with configuration: KMEducationDetailsViewModelConfiguration)
}

protocol KMEducationViewModelDelegate: AnyObject {
    func didReceiveEducationDetails()
}

class KMEducationViewModel: NSObject {
    
    weak var delegate: KMEducationViewModelDelegate?
    weak var coordinator: KMEducationViewModelCoordinator?
    
    private var configuration = KMEducationViewModelConfiguration()
    
    init(coordinator: KMEducationViewModelCoordinator) {
        self.coordinator = coordinator

    }
    
    func loadData() {
        delegate?.didReceiveEducationDetails()
    }
}

extension KMEducationViewModel {
    func buildAnimationItem() -> [EducationItem] {
        let animationItem = EducationAnimationItem(animation: configuration.details.animation)
        let item = EducationItem.animation(animationItem)
        return [item]
    }
}
