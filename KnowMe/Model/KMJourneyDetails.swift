//
//  KMJourneyDetails.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 15/02/2024.
//

import UIKit

struct CardContent {
    let image: String
    let title: String
    let content: String
}

struct KMJourneyDetails {
    let animation: String = "journey-main"
    let cards: [CardContent] = [
        CardContent(image: "good-chef",
                    title: KMJourneyStringKeys.goodchefCardTitle.localised,
                    content: KMJourneyStringKeys.goodchefCardContent.localised),
        CardContent(image: "our-recipes",
                    title: KMJourneyStringKeys.ourrecipesCardTitle.localised,
                    content: KMJourneyStringKeys.ourrecipesCardTitle.localised),
        CardContent(image: "todays-notes",
                    title: KMJourneyStringKeys.todaynotesCardTitle.localised,
                    content: KMJourneyStringKeys.todaynotesCardTitle.localised)
    ]
}

