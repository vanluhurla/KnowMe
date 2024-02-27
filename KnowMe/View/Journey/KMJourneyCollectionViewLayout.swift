//
//  KMJourneyCollectionViewLayout.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/02/2024.
//

import UIKit

struct KMJourneyCollectionViewLayout {
    static func layout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case JourneySection.animation.rawValue:
                return journeyAnimation()
            case JourneySection.card.rawValue:
                return journeyCardCarousel()
            default:
                return nil
            }
        }
    }
}

private extension KMJourneyCollectionViewLayout {
    static func journeyAnimation() -> NSCollectionLayoutSection? {
        let journeyAnimationCellSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                              heightDimension: .fractionalWidth(0.7))
        let journeyAnimationCell = NSCollectionLayoutItem(layoutSize: journeyAnimationCellSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [journeyAnimationCell])
        
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
//        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20.0))
//        let header = NSCollectionLayoutBoundarySupplementaryItem(
//            layoutSize: footerHeaderSize,
//            elementKind: UICollectionView.elementKindSectionHeader,
//            alignment: .top)
//        section.boundarySupplementaryItems = [header]
        
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 25, trailing: 10)
        
        return section
    }
    
        static func journeyCardCarousel() -> NSCollectionLayoutSection? {
            let journeyCardSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                         heightDimension: .fractionalHeight(0.7))
            let journeyCardCell = NSCollectionLayoutItem(layoutSize: journeyCardSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [journeyCardCell])
            
            let section = NSCollectionLayoutSection(group: group)
            
            section.orthogonalScrollingBehavior = .groupPaging
            
            //        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20.0))
            //        let header = NSCollectionLayoutBoundarySupplementaryItem(
            //            layoutSize: footerHeaderSize,
            //            elementKind: UICollectionView.elementKindSectionHeader,
            //            alignment: .top)
            //        section.boundarySupplementaryItems = [header]
            
            section.interGroupSpacing = 10
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 25, trailing: 10)
            
            return section
        }
}