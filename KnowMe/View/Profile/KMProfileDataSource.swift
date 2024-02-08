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

enum ProfileContentType {
    case personal, professional
}

enum ProfileItem: Hashable {
    case image(ProfileImageItem)
    case personalInfo(ProfileContent)
    case professionalInfo(ProfileContent)
}

struct ProfileImageItem: Hashable {
    let image: String
}

struct ProfileContent: Hashable {
    let type: ProfileContentType
    let info: String
    let icon: String
}
