//
//  AppStrings.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 14.07.2024.
//

import Foundation

enum AppStrings: String {
    case good_luck = "good_luck"
    case settings_screen = "settings_screen"
    case current_language = "current_language"
    case change_language = "change_language"
    case choose_language = "choose_language"
    case settings = "settings"
    case cancel = "cancel"
    
    case toAppSett = "to_app_set"
     
    var localized: String {
        return self.rawValue.localized()
    }
}
