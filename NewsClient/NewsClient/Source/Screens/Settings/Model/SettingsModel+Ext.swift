//
//  SettingsModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

extension SettingsModel: SettingsModelProtocol {
    
    func getCurrentTheme() -> String? {
        
        let defaults = UserDefaults.standard
        //let appMode = defaults.integer(forKey: "theme")
        let theme = defaults.string(forKey: "theme")// ?? ""
        
        return theme
    }
    
    func loadData() {
        
        var settings: [SettingsDataModel] = []
        
        let currentTheme = getCurrentTheme()
        
        debugPrint("\(String(describing: currentTheme))")
        
        var itemsMode: [SettingItem] = []
        itemsMode.append(SettingItem(title: "light", isOn: currentTheme == "light" ? true : false))
        itemsMode.append(SettingItem(title: "dark", isOn: currentTheme == "dark" ? true : false))
        itemsMode.append(SettingItem(title: "system", isOn: currentTheme == "system" || currentTheme == nil ? true : false))
        
        let settingMode: SettingsDataModel = SettingsDataModel(
            setting: Setting(title: "Mode"),
            items: itemsMode
        )
        
        settings.append(settingMode)
        
        delegate?.dataDidLoad(with: settings)
    }
}
