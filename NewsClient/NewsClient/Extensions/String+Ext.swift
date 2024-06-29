//
//  String+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

extension String {
    func localized() -> String {
        if let appLanguage = DefaultManager.getAppLanguage() {
            if appLanguage == 1 {
                let path = Bundle.main.path(forResource: "uk", ofType: "lproj")
                let bundle = Bundle(path: path!)
                return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
            }
        }
        let path = Bundle.main.path(forResource: "en", ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: "Localizable", bundle: bundle!, value: self, comment: self)
    }
}
