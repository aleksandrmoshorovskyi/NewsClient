//
//  Bundle+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 13.07.2024.
//

import Foundation

extension Bundle {
    
    private static var bundle: Bundle!
    
    public static func localizedBundle() -> Bundle {
        
        if bundle == nil {
            
            let appLang = Bundle.main.preferredLocalizations.first
            let path = Bundle.main.path(forResource: appLang, ofType: "lproj")
            
            bundle = Bundle(path: path!)
        }
        
        return bundle
    }
}
