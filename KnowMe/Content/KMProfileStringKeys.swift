//
//  KMProfileStringKeys.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 18/12/2023.
//

import Foundation

enum KMProfileStringKeys: String {
    case helloTitle = "hello"
    case aboutTitle = "about"
    case personalContentCell = "personal"
    case professionalContentCell = "professional"
    
    var localised: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
