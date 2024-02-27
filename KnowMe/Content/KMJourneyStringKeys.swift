//
//  KMJourneyStringKeys.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 19/02/2024.
//

import Foundation

enum KMJourneyStringKeys: String {
    case journeyMainTitle = "journeyMainTitle"
    case personalProjectsTitle = "personalProjects"
    case goodchefCardContent = "goodChef"
    case ourrecipesCardContent = "ourRecipes"
    case todaynotesCardContent = "todaysNotes"
    case goodchefCardTitle = "journeyFirstTitle"
    case ourrecipesCardTitle = "journeySecondTitle"
    case todaynotesCardTitle = "journeyThirdTitle"
    
    var localised: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
