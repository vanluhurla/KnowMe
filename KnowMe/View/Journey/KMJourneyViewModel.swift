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

protocol KMJourneyViewModelCoordinator: AnyObject {
    func presentJourneyDetails(with configuration: KMJourneyDetailsViewModelConfiguration)
}

protocol KMJourneyViewModelDelegate: AnyObject {
    func didReceiveJourneyDetails()
}

class KMJourneyViewModel: NSObject {
    
    weak var delegate: KMJourneyViewModelDelegate?
    weak var coordinator: KMJourneyViewModelCoordinator?
    
    private var configuration = KMJourneyViewModelConfiguration()
    
    init(coordinator: KMJourneyViewModelCoordinator) {
        self.coordinator = coordinator
    }
    
    func didSelectItem(indexPath: IndexPath) {
        guard let selectedSection = JourneySection(rawValue: indexPath.section) else {
            return
        }
        switch selectedSection {
        case .animation:
            return
        case .card:
            return handleSelectedCard(indexPath: indexPath)
        }
    }
    
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
    
    func buildCards() -> [JourneyItem] {
        configuration.details.cards.map { content in
            let cardItem = JourneyCard(image: content.image,
                                       title: content.title)
            return JourneyItem.card(cardItem)
        }
    }
}

private extension KMJourneyViewModel {
    func handleSelectedCard(indexPath: IndexPath) {
        let selectedCard = configuration.details.cards[indexPath.row]
        let configuration = KMJourneyDetailsViewModelConfiguration(content: selectedCard)
        coordinator?.presentJourneyDetails(with: configuration)
    }
}

