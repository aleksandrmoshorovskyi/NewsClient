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
    
    var countryName: String {
        switch self {
        case .Poland:
            return "Poland"
        case .Ukraine:
            return "Ukraine"
        case .UnitedKingdom:
            //return "United Kingdom"
            return "UK"
        case .UnitedStates:
            return "USA"
        }
    }
    
    var countryFlag: String {
        switch self {
        case .Poland:
            return "🇵🇱"
        case .Ukraine:
            return "🇺🇦"
        case .UnitedKingdom:
            //return "United Kingdom"
            return "🇬🇧"
        case .UnitedStates:
            return "🇺🇸"
        }
    }
}
