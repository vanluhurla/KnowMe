//
//  KMDetailsViewModel.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 26/01/2024.
//

import Foundation

struct KMGenericBottomSheetConfiguration {
    let text: String
    let animation: String
    let type: ProfileContentType
}

protocol KMGenericBottomSheetDelegate: AnyObject {
    func didReceiveContent(text: String, animation: String, type: ProfileContentType)
}

class KMDetailsViewModel: NSObject {
    
    private let configuration: KMGenericBottomSheetConfiguration
    
    weak var delegate: KMGenericBottomSheetDelegate?
    
    init(configuration: KMGenericBottomSheetConfiguration) {
        self.configuration = configuration
 
    }
    
    func loadData() {
        delegate?.didReceiveContent(text: configuration.text, animation: configuration.animation, type: configuration.type)
    }
}
