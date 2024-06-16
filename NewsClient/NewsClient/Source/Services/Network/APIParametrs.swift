//
//  APIParametrs.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

//Common
enum Country: String {
    case UAE = "ae"
    case Ukraine = "ua"
    case UnitedKingdom = "gb"
    case UnitedStates = "us"
    case Venuzuela = "ve"
}

/*
enum Category: String {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}
 */

enum Category: String, CaseIterable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
    
//    static func allValues() -> [String] {
//        return [All, Genre, Author].map({$0.description})
//    }
//
//    public var description: String {
//        switch self {
//        case .All:
//            return "All"
//        case .Genre:
//            return "Genre"
//        case .Author:
//            return "Author"
//        }
//    }
}

//let dfd = Category.AllCases.first

