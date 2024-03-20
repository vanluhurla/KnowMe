//
//  KMEducationStringKeys.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 18/03/2024.
//

import Foundation

enum KMEducationStringKeys: String {
    case uniCellTitle = "uniDescriptionTitle"
    case uniCellContent = "uniDescriptionCont"
    case iosSwiftCellTitle = "iosSwiftCourseTitle"
    case iosSwiftCellContent = "iosSwiftCourseCont"
    case iosDevMoocCellTitle = "iosDevMoocCourseTitle"
    case iosDevMoocCellContent = "iosDevMoocCourseCont"
    case fundLogicCellTitle = "fundLogicCourseTitle"
    case fundLogicCellContent = "fundLogicCourseCont"
    case iosEssencialCellTitle = "iosEssencialCourseTitle"
    case iosEssencialCellContent = "iosEssencialCourseCont"
    case iosArchitecCellTitle = "iosArchitecCourseTitle"
    case iosArchitecCellContent = "iosArchitecCourseCont"
    case webDevCellTitle = "webDevCourseTitle"
    case webDevCellContent = "webDevCourseCont"
    case uxBeginnerCellTitle = "uxBeginnerCourseTitle"
    case uxBeginnerCellContent = "uxBeginnerCourseCont"
    
    var localised: String {
        NSLocalizedString(self.rawValue, comment: "")
    }
}
