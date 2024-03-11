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
    let icon: String
    let content: String
}

struct KMJourneyDetails {
    let animation: String = "journey-main"
    let cards: [CardContent] = [
        CardContent(
            image: "good-chef",
            title: KMJourneyStringKeys.goodchefCardTitle.localised,
            icon: "cooking",
            content: KMJourneyStringKeys.goodchefCardContent.localised
        ),
        CardContent(
            image: "our-recipes",
            title: KMJourneyStringKeys.ourrecipesCardTitle.localised,
            icon: "recipe-book",
            content: KMJourneyStringKeys.ourrecipesCardContent.localised
        ),
        CardContent(
            image: "todays-notes",
            title: KMJourneyStringKeys.todaynotesCardTitle.localised,
            icon: "notepad",
            content: KMJourneyStringKeys.todaynotesCardContent.localised
        )
    ]
}

