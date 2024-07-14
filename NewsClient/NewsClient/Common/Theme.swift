//
//  Theme.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import UIKit

enum Theme: String, CaseIterable {
    case light, dark, system

    var uiInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        case .system:
            return .unspecified
        }
    }
    
    var image: UIImage? {
        switch self {
        case .light:
            return UIImage(systemName: "sun.max")
        case .dark:
            return UIImage(systemName: "moon")
        case .system:
            return UIImage(systemName: "gearshape")
        }
    }
    
    var localized: String {
        //return self.rawValue.localized()
        return self.rawValue.localized
    }
}
