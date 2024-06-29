//
//  DefaultManager.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

class DefaultManager: NSObject {
    static let KEY_AppLanguage = "appLanguage"
    
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
}
