//
//  KMProfileDataSource.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/12/2023.
//

import UIKit

typealias KMProfileDataSource = UICollectionViewDiffableDataSource<ProfileSection, ProfileItem>
typealias KMProfileSnapshot = NSDiffableDataSourceSnapshot<ProfileSection, ProfileItem>

enum ProfileSection: Int, CaseIterable {
    case image
    case personalInfo
    case professionalInfo
    
    var sectionTitle: String {
        switch self {
        case .image:
            return KMProfileStringKeys.firstTitle.localised
        case .personalInfo:
            return KMProfileStringKeys.secondTitle.localised
        case .professionalInfo:
            return ""
        }
    }
    
}

enum ProfileItem: Hashable {
    case image(ProfileImageItem)
    case personalInfo(ProfilePersonalItem)
    case professionalInfo(ProfileProfessionalItem)
}

struct ProfileImageItem: Hashable {
    let image: String
}

struct ProfilePersonalItem: Hashable {
    let personalInfo: String
}

struct ProfileProfessionalItem: Hashable {
    let professionalInfo: String
}
