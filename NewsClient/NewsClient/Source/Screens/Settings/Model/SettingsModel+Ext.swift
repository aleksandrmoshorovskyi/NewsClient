//
//  SettingsModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

extension SettingsModel: SettingsModelProtocol {
    
//    func getCurrentTheme() -> String? {
//        
//        let defaults = UserDefaults.standard
//        //let appMode = defaults.integer(forKey: "theme")
//        let theme = defaults.string(forKey: "theme")// ?? ""
//        
//        return theme
//    }
    
    func loadData() {
        
        var settings: [SettingsDataModel] = []
        
        //MARK: dark/light Mode
        //let currentTheme = getCurrentTheme()
        var currentTheme = DefaultManager.getAppTheme()
        if currentTheme == nil {
            currentTheme = Theme.system
        }
        
        debugPrint("currentTheme - \(String(describing: currentTheme))")
        
        var itemsMode: [SettingItem] = []
        Theme.allCases.forEach() {//_ in
            itemsMode.append(SettingItem(
                title: "\($0.icon) \($0.rawValue.localized())",//"light".localized(),
                isOn: currentTheme == $0 ? true : false,
                valueForDefault: $0
            ))
        }
        //itemsMode.append(SettingItem(title: "light".localized(), isOn: currentTheme == "light" ? true : false))
        //itemsMode.append(SettingItem(title: "dark".localized(), isOn: currentTheme == "dark" ? true : false))
        //itemsMode.append(SettingItem(title: "system".localized(), isOn: currentTheme == "system" || currentTheme == nil ? true : false))
        
        let settingMode: SettingsDataModel = SettingsDataModel(
            setting: Setting(title: "mode".localized()),
            items: itemsMode
        )
        
        settings.append(settingMode)
        
        
        //MARK: app Language
        let currentLanguage = DefaultManager.getAppLanguage()
        
        debugPrint("currentLanguage - \(String(describing: currentLanguage))")
        
        var languages: [SettingItem] = []
        languages.append(SettingItem(
            title: "\("🔤") \("English".localized())",
            isOn: currentLanguage == 0 ? true : false
        ))
        languages.append(SettingItem(
            title: "\("🇺🇦") \("Ukrainian".localized())",
            isOn: currentLanguage == 1 ? true : false
        ))
        languages.append(SettingItem(
            //title: "\("⚙️") \("default".localized())",
            title: "\("⚙️") \("system".localized())",
            isOn: currentLanguage == nil ? true : false
        ))
        
        let language: SettingsDataModel = SettingsDataModel(
            setting: Setting(title: "interface language".localized()),
            items: languages
        )
        
        settings.append(language)
        
        
        //MARK: app Country
        let currentCountry = DefaultManager.getAppCountry()?.rawValue
        
        debugPrint("currentCountry - \(String(describing: currentCountry))")
        
        var countries: [SettingItem] = []
        Country.allCases.forEach() {
            countries.append(SettingItem(
                title: "\($0.countryFlag) \($0.countryName.localized())",
                isOn: currentCountry == $0.rawValue ? true : false,
                valueForDefault: $0
            ))
        }
        
        let country: SettingsDataModel = SettingsDataModel(
            setting: Setting(title: "country".localized()),
            items: countries
        )
        
        settings.append(country)
        
        
        delegate?.dataDidLoad(with: settings)
    }
}
