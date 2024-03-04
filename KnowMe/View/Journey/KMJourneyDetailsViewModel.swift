//
//  KMJourneyDetailsViewModel.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 27/02/2024.
//

import Foundation

struct KMJourneyDetailsViewModelConfiguration {
    let content: CardContent
}

protocol KMJourneyDetailsViewModelDelegate: AnyObject {
    func didReceiveContent()
}

class KMJourneyDetailsViewModel: NSObject {
    
    weak var delegate: KMJourneyDetailsViewModelDelegate?
    
    private let configuration: KMJourneyDetailsViewModelConfiguration
    
    init(configuration: KMJourneyDetailsViewModelConfiguration) {
        self.configuration = configuration
    }
    
    func loadData() {
        delegate?.didReceiveContent()
    }
}
