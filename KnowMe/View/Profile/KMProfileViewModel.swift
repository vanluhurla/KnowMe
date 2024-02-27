//
//  KMProfileViewModel.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import Foundation

struct KMProfileViewModelConfiguration {
    let details = KMProfileDetails()
}

protocol KMProfileViewModelCoordinator: AnyObject {
    func presentBottomSheet(with configuration: KMGenericBottomSheetConfiguration)
}

protocol KMProfileViewModelDelegate: AnyObject {
    func didRecieveProfileDetails()
}

class KMProfileViewModel: NSObject {
    
    weak var coordinator: KMProfileViewModelCoordinator?
    weak var delegate: KMProfileViewModelDelegate?
    
    init(coordinator: KMProfileViewModelCoordinator) {
        self.coordinator = coordinator
    }
    
    private var configuration = KMProfileViewModelConfiguration()
    
    func loadData() {
        delegate?.didRecieveProfileDetails()
    }
}

extension KMProfileViewModel {
    func buildAnimationItem() -> [ProfileItem] {
        let animationItem = ProfileAnimationItem(animation: configuration.details.animation)
        let item = ProfileItem.animation(animationItem)
        return [item]
    }
    
    func buildPersonalItem() -> [ProfileItem] {
        let contentItem = ProfileContent(type: .personal,
                                         info: configuration.details.personalInfo,
                                         icon: configuration.details.personalInfoIcon)
        let item = ProfileItem.personalInfo(contentItem)
        return [item]
    }
    
    func buildProfessionalItem() -> [ProfileItem] {
        let contentItem = ProfileContent(type: .professional,
                                         info: configuration.details.professionalInfo,
                                         icon: configuration.details.professionalInfoIcon)
        let item = ProfileItem.professionalInfo(contentItem)
        return [item]
    }
    
    func buildBottomSheetConfiguration(type: ProfileContentType) -> KMGenericBottomSheetConfiguration {
        switch type {
        case .personal:
            return KMGenericBottomSheetConfiguration(text: configuration.details.personalInfo,
                                                     animation: configuration.details.personalInfoIcon, 
                                                     type: type)
        case .professional:
            return KMGenericBottomSheetConfiguration(text: configuration.details.professionalInfo,
                                                     animation: configuration.details.professionalInfoIcon, 
                                                     type: type)
        }
    }
    
    func didTapReadMeButton(type: ProfileContentType) {
        let configuration = buildBottomSheetConfiguration(type: type)
        coordinator?.presentBottomSheet(with: configuration)
    }
}
