//
//  KMJourneyDataSource.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/02/2024.
//

import UIKit

typealias KMJourneyDataSource = UICollectionViewDiffableDataSource<JourneySection, JourneyItem>
typealias KMJourneySnapshot = NSDiffableDataSourceSnapshot<JourneySection, JourneyItem>


enum JourneySection: Int, CaseIterable {
    case animation, card
    
    var sectionTitle: String {
        switch self {
        case .animation:
            return ""
        case .card:
            return KMJourneyStringKeys.personalProjectsTitle.localised
        }
    }
}

enum JourneyItem: Hashable {
    case animation(JourneyAnimationItem)
    case card (JourneyCard)
}

struct JourneyAnimationItem: Hashable {
    let animation: String
}

struct JourneyCard: Hashable {
    let image: String
    let title: String
}
