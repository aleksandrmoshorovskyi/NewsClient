//
//  Theme.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import UIKit

enum Theme: String, CaseIterable {
    case light, dark, system

    // Utility var to pass directly to window.overrideUserInterfaceStyle
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
    
    var icon: String {
        switch self {
        case .light:
            return "◻️"
        case .dark:
            return "◼️"
        case .system:
            return "⚙️"
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
}
