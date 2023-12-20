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

protocol KMProfileViewModelDelegate: AnyObject {
    func didRecieveProfileDetails()
}

class KMProfileViewModel: NSObject {
    
    weak var delegate: KMProfileViewModelDelegate?
    
    private var configuration = KMProfileViewModelConfiguration()
    
    func loadData() {
        delegate?.didRecieveProfileDetails()
    }
}

extension KMProfileViewModel {
    func buildImageItem() -> [ProfileItem] {
        let imageItem = ProfileImageItem(image: configuration.details.image)
        let item = ProfileItem.image(imageItem)
        return [item]
    }
    
    func buildPersonalItem() -> [ProfileItem] {
        let personalItem = ProfilePersonalItem(personalInfo: configuration.details.personalInfor)
        let item = ProfileItem.personalInfo(personalItem)
        return [item]
    }
    
    func buildProfessionalItem() -> [ProfileItem] {
        let professionalItem = ProfileProfessionalItem(professionalInfo: configuration.details.professionalInfo)
        let item = ProfileItem.professionalInfo(professionalItem)
        return [item]
    }
}
