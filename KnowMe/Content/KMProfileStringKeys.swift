//
//  KMProfileStringKeys.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 18/12/2023.
//

import Foundation

enum KMProfileStringKeys: String {
    case firstTitle = "hello"
    case secondTitle = "about"
    case firstCell = "personal"
    case secondCell = "professional"
    
    var localised: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
