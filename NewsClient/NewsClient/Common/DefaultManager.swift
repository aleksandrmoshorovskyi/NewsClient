//
//  DefaultManager.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

class DefaultManager: NSObject {
    static let KEY_Theme = "appTheme"
    static let KEY_AppLanguage = "appLanguage"
    static let KEY_Country = "appCountry"
    
    static let KEY_Keywords = "searchKeywords"
    
    //MARK: appTheme
    static func setAppTheme(_ theme: Theme) {
        UserDefaults.standard.set(theme.rawValue, forKey: KEY_Theme)
        UserDefaults.standard.synchronize()
    }
    
    static func getAppTheme() -> Theme? {
        
        var theme: Theme? = nil
        
        if let rawValue = UserDefaults.standard.value(forKey: KEY_Theme) as? String {
            theme = Theme(rawValue: rawValue)
        }
        
        return theme
    }
    
    static func removeAppTheme() {
        UserDefaults.standard.removeObject(forKey: KEY_Theme)
        UserDefaults.standard.synchronize()
    }
    
    //MARK: AppLanguage
    static func setAppLanguage(ver: Int) {
        UserDefaults.standard.set(ver, forKey: KEY_AppLanguage)
        UserDefaults.standard.synchronize()
    }
    
    static func getAppLanguage() -> Int? {
        if let ver = UserDefaults.standard.value(forKey: KEY_AppLanguage) as? Int {
            return ver
        }
        return nil
    }
    
    static func removeAppLanguage() {
        UserDefaults.standard.removeObject(forKey: KEY_AppLanguage)
        UserDefaults.standard.synchronize()
    }
    
    //MARK: Country
    static func setAppCountry(_ country: Country) {
        UserDefaults.standard.set(country.rawValue, forKey: KEY_Country)
        UserDefaults.standard.synchronize()
    }
    
    static func getAppCountry() -> Country? {
        
        var country: Country? = nil
        
        if let rawValue = UserDefaults.standard.value(forKey: KEY_Country) as? String {
            country = Country(rawValue: rawValue)
        }
        
        return country
    }
    
    static func removeAppCountry() {
        UserDefaults.standard.removeObject(forKey: KEY_Country)
        UserDefaults.standard.synchronize()
    }
    
    //MARK: searchKeywords
    static func setSearchKeywords(_ keywords: [String]?) {
        
        if let keywords = keywords {
            let keywordsStr = keywords.joined(separator: ";")
            debugPrint(keywords)
            UserDefaults.standard.set(keywordsStr, forKey: KEY_Keywords)
            UserDefaults.standard.synchronize()
        }
    }
    
    static func getSearchKeywords() -> [String]? {
        
        var keywords: [String]? = nil
        
        if let rawValue = UserDefaults.standard.value(forKey: KEY_Keywords) as? String {
            //country = Country(rawValue: rawValue)
            //let string = "1;2;3"
            //let array = string.components(separatedBy: ";")
            keywords = rawValue.components(separatedBy: ";")
            //debugPrint(keywords ?? "")
        }
        
        debugPrint(keywords ?? "")
        
        return keywords
    }
    
    static func removeSearchKeywords() {
        UserDefaults.standard.removeObject(forKey: KEY_Keywords)
        UserDefaults.standard.synchronize()
    }
}
