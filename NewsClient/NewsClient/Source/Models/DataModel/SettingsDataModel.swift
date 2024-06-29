//
//  SettingsDataModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

struct SettingsDataModel {
    
    let setting: Setting
    var items: [SettingItem]
}

struct Setting {
    
    let title: String
}

struct SettingItem {
    
    let title: String
    var isOn: Bool
}
