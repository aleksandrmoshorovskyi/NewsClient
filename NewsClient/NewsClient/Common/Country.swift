//
//  Country.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import Foundation

enum Country: String, CaseIterable {
    case Poland = "pl"
    case Ukraine = "ua"
    case UnitedKingdom = "gb"
    case UnitedStates = "us"
//    case Japan = "jp"
    
    var countryName: String {
        switch self {
        case .Poland:
            return AppStrings.Country_countryName_Poland.localized
        case .Ukraine:
            return AppStrings.Country_countryName_Ukraine.localized
        case .UnitedKingdom:
            return AppStrings.Country_countryName_UK.localized
        case .UnitedStates:
            return AppStrings.Country_countryName_USA.localized
//        case .Japan:
//            return AppStrings.Country_countryName_Japan.localized
        }
    }
    
    var countryFlag: String {
        switch self {
        case .Poland:
            return "🇵🇱"
        case .Ukraine:
            return "🇺🇦"
        case .UnitedKingdom:
            return "🇬🇧"
        case .UnitedStates:
            return "🇺🇸"
//        case .Japan:
//            return "🇯🇵"
        }
    }
}
