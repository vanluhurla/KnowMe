//
//  KMEducationDetails.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 13/03/2024.
//

import UIKit

struct CellContent {
    let icon: String
    let title: String
    let content: String
}

struct KMEducationDetails {
    let animation: String = "education"
    let cells: [CellContent] = [CellContent(icon: "graduation", 
                                            title: KMEducationStringKeys.uniCellTitle.localised,
                                            content: KMEducationStringKeys.uniCellContent.localised),
                                CellContent(icon: "iphone",
                                            title: KMEducationStringKeys.iosSwiftCellTitle.localised,
                                            content: KMEducationStringKeys.iosSwiftCellContent.localised),
                                CellContent(icon: "iphone",
                                            title: KMEducationStringKeys.iosDevMoocCellTitle.localised,
                                            content: KMEducationStringKeys.iosDevMoocCellContent.localised),
                                CellContent(icon: "idea",
                                            title: KMEducationStringKeys.fundLogicCellTitle.localised,
                                            content: KMEducationStringKeys.fundLogicCellContent.localised),
                                CellContent(icon: "iphone",
                                            title: KMEducationStringKeys.iosEssencialCellTitle.localised,
                                            content: KMEducationStringKeys.iosEssencialCellContent.localised),
                                CellContent(icon: "iphone",
                                            title: KMEducationStringKeys.iosArchitecCellTitle.localised,
                                            content: KMEducationStringKeys.iosArchitecCellContent.localised),
                                CellContent(icon: "web", 
                                            title: KMEducationStringKeys.webDevCellTitle.localised,
                                            content: KMEducationStringKeys.webDevCellContent.localised),
                                CellContent(icon: "user",
                                            title: KMEducationStringKeys.uxBeginnerCellTitle.localised,
                                            content: KMEducationStringKeys.uxBeginnerCellContent.localised)]
}

