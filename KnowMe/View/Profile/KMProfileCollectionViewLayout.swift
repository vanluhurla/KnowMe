//
//  KMProfileCollectionViewLayout.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/12/2023.
//

import UIKit

struct KMProfileCollectionViewLayout {
    static func layout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case ProfileSection.animation.rawValue:
                return profileImage()
            case ProfileSection.personalInfo.rawValue:
                return profileDetailsText()
            case ProfileSection.professionalInfo.rawValue:
                return profileDetailsText()
            default:
                return nil
            }
        }
    }
}

private extension KMProfileCollectionViewLayout {
    static func profileImage() -> NSCollectionLayoutSection? {
        let profileImageCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                          heightDimension: .fractionalWidth(0.7))
        let profileImageCell = NSCollectionLayoutItem(layoutSize: profileImageCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), 
                                               heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [profileImageCell])
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 50, trailing: 0)
                                                        
        return section
    }
    
    static func profileDetailsText() -> NSCollectionLayoutSection? {
        let detailsTextCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), 
                                                         heightDimension: .estimated(50))
        let detailsTextCell = NSCollectionLayoutItem(layoutSize: detailsTextCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), 
                                               heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, 
                                                     subitems: [detailsTextCell])
        
        let section = NSCollectionLayoutSection(group: group)
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(400))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        
        section.boundarySupplementaryItems = [header]
        section.interGroupSpacing = 0
        section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 10, bottom: 0, trailing: 10)
        return section
    }
}
