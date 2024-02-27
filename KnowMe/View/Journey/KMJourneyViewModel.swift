//
//  KMJourneyViewModel.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import Foundation

struct KMJourneyViewModelConfiguration {
    let details = KMJourneyDetails()
}

protocol KMJourneyViewModelDelegate: AnyObject {
    func didReceiveJourneyDetails()
}

class KMJourneyViewModel: NSObject {
    
    weak var delegate: KMJourneyViewModelDelegate?
    
    private var configuration = KMJourneyViewModelConfiguration()
    
    func loadData() {
        delegate?.didReceiveJourneyDetails()
    }
}

extension KMJourneyViewModel {
    func buildAnimationItem() -> [JourneyItem] {
        let animationItem = JourneyAnimationItem(animation: configuration.details.animation)
        let item = JourneyItem.animation(animationItem)
        return [item]
    }
    
    func buildGoodchefCardItem() -> [JourneyItem] {
        let cardItem = JourneyCard(image: configuration.details.firstCardImage, title: configuration.details.firstCardTitle)
        let item = JourneyItem.card(cardItem)
        return [item]
    }
    
    func buildOurrecipesCardItem() -> [JourneyItem] {
        let cardItem = JourneyCard(image: configuration.details.secondCardImage, title: configuration.details.secondCardTitle)
        let item = JourneyItem.card(cardItem)
        return [item]
    }
    
    func buildTodaysnotesCardItem() -> [JourneyItem] {
        let cardItem = JourneyCard(image: configuration.details.thirdCardImage, title: configuration.details.thirdCardTitle)
        let item = JourneyItem.card(cardItem)
        return [item]
    }
}
