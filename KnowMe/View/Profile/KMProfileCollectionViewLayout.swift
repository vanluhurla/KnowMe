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
            case ProfileSection.image.rawValue:
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
                                                          heightDimension: .fractionalWidth(1.0))
        let profileImageCell = NSCollectionLayoutItem(layoutSize: profileImageCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [profileImageCell])
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [header]
        
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 25, trailing: 10)
        
        return section
    }
    
    static func profileDetailsText() -> NSCollectionLayoutSection? {
        let detailsTextCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(60))
        let detailsTextCell = NSCollectionLayoutItem(layoutSize: detailsTextCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [detailsTextCell])
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 10)
        section.boundarySupplementaryItems = [header]
        
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 5, trailing: 10)
        
        return section
    }
}
