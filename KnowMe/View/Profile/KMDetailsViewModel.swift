//
//  KMDetailsViewModel.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 26/01/2024.
//

import Foundation

struct KMGenericBottomSheetConfiguration {
    let text: String
    let icon: String
}

protocol KMGenericBottomSheetDelegate: AnyObject {
    func didReceiveContent(text: String, icon: String)
}

class KMDetailsViewModel: NSObject {
    
    private let configuration: KMGenericBottomSheetConfiguration
    
    weak var delegate: KMGenericBottomSheetDelegate?
    
    init(configuration: KMGenericBottomSheetConfiguration) {
        self.configuration = configuration
 
    }
    
    func loadData() {
        delegate?.didReceiveContent(text: configuration.text, icon: configuration.icon)
    }
}
