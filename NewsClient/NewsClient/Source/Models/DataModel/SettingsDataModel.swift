//
//  SettingsDataModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import UIKit

struct SettingsDataModel {
    
    let setting: Setting
    var items: [SettingItem]
}

struct Setting {
    
    let title: String
}

struct SettingItem {
    
    let title: String
    let icon: UIImage?
    var isOn: Bool
    var valueForDefault: Any?
}
