//
//  Category.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import Foundation

enum Category: String, CaseIterable {
    case general = "general"
    case business = "business"
    case entertainment = "entertainment"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
    
    var localized: String {
        //return self.rawValue.localized()
        return self.rawValue.localized
    }
}
