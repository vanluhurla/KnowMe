//
//  KMEducationCollectionViewLayout.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 13/03/2024.
//

import UIKit

struct KMEducationCollectionViewLayout {
    static func layout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case EducationSection.animation.rawValue:
                return educationAnimation()
            case EducationSection.cell.rawValue:
                return educationCellContent()
            default:
                return nil
            }
        }
    }
}

extension KMEducationCollectionViewLayout {
    static func educationAnimation() -> NSCollectionLayoutSection? {
        let educationAnimationCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .fractionalWidth(0.6))
        let educationAnimationCell = NSCollectionLayoutItem(layoutSize: educationAnimationCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [educationAnimationCell])
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 70, trailing: 0)
        
        return section
    }
    
    static func educationCellContent() -> NSCollectionLayoutSection? {
        let educationContentCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .fractionalHeight(0.8))
        let educationContentCell = NSCollectionLayoutItem(layoutSize: educationContentCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize,
                                                     subitems: [educationContentCell])
        group.interItemSpacing = .fixed(50)
        
        let section = NSCollectionLayoutSection(group: group)
//        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(400))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: footerHeaderSize,
//            elementKind: UICollectionView.elementKindSectionHeader,
//            alignment: .top)
//        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 40, trailing: 10)
//        
//        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return section
    }
}

