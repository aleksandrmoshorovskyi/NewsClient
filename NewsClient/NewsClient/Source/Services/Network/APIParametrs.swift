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

enum Category: String, CaseIterable {
    case general = "general"
    case business = "business"
    case entertainment = "entertainment"
    //case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
    
//    static func allValues() -> [Category] {
//        Category.allCases.forEach() {
//            dataSource.append($0)
//        }
//        
//        return self.allCases.forEach() {}
//    }
    //        return [All, Genre, Author].map({$0.description})
    //    }
}
