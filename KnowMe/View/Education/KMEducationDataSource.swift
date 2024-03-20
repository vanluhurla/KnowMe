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
    case animation, cell
}

enum EducationItem: Hashable {
    case animation(EducationAnimationItem)
    case cell(EducationCellItem)
}

struct EducationAnimationItem: Hashable {
    let animation: String
}

struct EducationCellItem: Hashable {
    let icon: String
    let title: String
    let content: String
}

