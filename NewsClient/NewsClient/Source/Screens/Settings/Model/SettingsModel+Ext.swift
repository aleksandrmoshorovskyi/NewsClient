//
//  SettingsModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

extension SettingsModel: SettingsModelProtocol {
    
    func loadData() {
        
        var settings: [SettingsDataModel] = []
        
        //MARK: dark/light Mode
        var currentTheme = DefaultManager.getAppTheme()
//        if currentTheme == nil {
//            currentTheme = Theme.system
//        }
        currentTheme = currentTheme != nil ? currentTheme : Theme.system
        debugPrint("currentTheme - \(String(describing: currentTheme))")
        
        var itemsMode: [SettingItem] = []
        Theme.allCases.forEach() {//_ in
            itemsMode.append(SettingItem(
                title: $0.rawValue.localized,
                icon: $0.image,
                isOn: currentTheme == $0 ? true : false,
                valueForDefault: $0
            ))
        }
        
        let settingMode: SettingsDataModel = SettingsDataModel(
            setting: Setting(title: AppStrings.SettingsViewController_mode_title.localized),
            items: itemsMode
        )
        
        settings.append(settingMode)
        
        
        //MARK: app Language
        var languages: [SettingItem] = []

        languages.append(SettingItem(
            //title: "\("change language".localized())",
            title: AppStrings.SettingsViewController_change_language_title.localized,
            icon: Constants.changeLanguageImage,
            isOn: false
        ))
        
        let language: SettingsDataModel = SettingsDataModel(
            //setting: Setting(title: "interface language".localized()),
            setting: Setting(title: AppStrings.SettingsViewController_interface_language_title.localized),
            items: languages
        )
        
        settings.append(language)
        
        
        //MARK: app Country
        let currentCountry = DefaultManager.getAppCountry()?.rawValue
        
        debugPrint("currentCountry - \(String(describing: currentCountry))")
        
        var countries: [SettingItem] = []
        Country.allCases.forEach() {
            countries.append(SettingItem(
                title: $0.countryName.localized,
                icon: $0.countryFlag.textToImage(),
                isOn: currentCountry == $0.rawValue ? true : false,
                valueForDefault: $0
            ))
        }
        
        let country: SettingsDataModel = SettingsDataModel(
            //setting: Setting(title: "country".localized()),
            setting: Setting(title: AppStrings.SettingsViewController_country_title.localized),
            items: countries
        )
        
        settings.append(country)
        
        
        delegate?.dataDidLoad(with: settings)
    }
}
