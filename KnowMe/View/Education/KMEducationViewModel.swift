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
    
    func buildCells() -> [EducationItem] {
        configuration.details.cells.map { content in
            let cellItem = EducationCellItem(icon: content.icon, title: content.title,
                                             content: content.content)
            return EducationItem.cell(cellItem)
        }
    }
}
