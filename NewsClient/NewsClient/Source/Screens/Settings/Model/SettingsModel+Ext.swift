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
        
        //MARK: dark/light Mode
        let currentTheme = getCurrentTheme()
        
        debugPrint("currentTheme - \(String(describing: currentTheme))")
        
        var itemsMode: [SettingItem] = []
        itemsMode.append(SettingItem(title: "light".localized(), isOn: currentTheme == "light" ? true : false))
        itemsMode.append(SettingItem(title: "dark".localized(), isOn: currentTheme == "dark" ? true : false))
        itemsMode.append(SettingItem(title: "system".localized(), isOn: currentTheme == "system" || currentTheme == nil ? true : false))
        
        let settingMode: SettingsDataModel = SettingsDataModel(
            setting: Setting(title: "Mode".localized()),
            items: itemsMode
        )
        
        settings.append(settingMode)
        
        
        //MARK: app Language
        let currentLanguage = DefaultManager.getAppLanguage()
        
        debugPrint("currentLanguage - \(String(describing: currentLanguage))")
        
        var languages: [SettingItem] = []
        languages.append(SettingItem(title: "English".localized(), isOn: currentLanguage == 0 ? true : false))
        languages.append(SettingItem(title: "Ukrainian".localized(), isOn: currentLanguage == 1 ? true : false))
        languages.append(SettingItem(title: "default".localized(), isOn: currentLanguage == nil ? true : false))
        
        let language: SettingsDataModel = SettingsDataModel(
            setting: Setting(title: "Language".localized()),
            items: languages
        )
        
        settings.append(language)
        
        
        delegate?.dataDidLoad(with: settings)
    }
}
