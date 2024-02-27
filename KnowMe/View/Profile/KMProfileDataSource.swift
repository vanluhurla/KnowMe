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
    case animation
    case personalInfo
    case professionalInfo
    
    var sectionTitle: String {
        switch self {
        case .animation:
            return KMProfileStringKeys.helloTitle.localised
        case .personalInfo:
            return KMProfileStringKeys.aboutTitle.localised
        case .professionalInfo:
            return ""
        }
    }
}

enum ProfileContentType {
    case personal, professional
}

enum ProfileItem: Hashable {
    case animation(ProfileAnimationItem)
    case personalInfo(ProfileContent)
    case professionalInfo(ProfileContent)
}

struct ProfileAnimationItem: Hashable {
    let animation: String
}

struct ProfileContent: Hashable {
    let type: ProfileContentType
    let info: String
    let icon: String
}


