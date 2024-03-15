//
//  KMEducationDataSource.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 13/03/2024.
//

import UIKit

typealias KMEducationDataSource = UICollectionViewDiffableDataSource<EducationSection, EducationItem>
typealias KMEducationSnapshot = NSDiffableDataSourceSnapshot<EducationSection, EducationItem>


enum EducationSection: Int, CaseIterable {
    case animation, card
}

enum EducationItem: Hashable {
    case animation(EducationAnimationItem)
    case card(EducationCardItem)
}

struct EducationAnimationItem: Hashable {
    let animation: String
}

struct EducationCardItem: Hashable {
    let icon: String
    let title: String
}

