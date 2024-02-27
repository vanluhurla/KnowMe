//
//  KMMainCoordinator.swift
//  KnowMe
//
//  Created by Vanessa Hurla on 11/12/2023.
//

import UIKit

enum KMTab: Int {
    case profile, journey, education, skills, hobbies
    
    var title: String {
        switch self {
        case .profile:
            return "Profile"
        case .journey:
            return "Journey"
        case .education:
            return "Education"
        case .skills:
            return "Skills"
        case .hobbies:
            return "Hobbies"
        }
    }
    
    var icon: UIImage? {
        switch self {
        case .profile:
            return UIImage(systemName: "person.text.rectangle")
        case .journey:
            return UIImage(systemName: "apps.iphone")
        case .education:
            return UIImage(systemName: "books.vertical")
        case .skills:
            return UIImage(systemName: "star")
        case .hobbies:
            return UIImage(systemName: "suit.heart")
            
        }
    }
}

class KMMainCoordinator {
    let tabBarController = KMTabController()
}
