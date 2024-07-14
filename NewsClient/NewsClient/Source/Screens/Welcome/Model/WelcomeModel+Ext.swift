//
//  WelcomeModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import Foundation

extension WelcomeModel: WelcomeModelProtocol {
    
    func loadData() {
        
        let countries: [Country] = Country.allCases
        
        delegate?.dataDidLoad(with: countries)
    }
}
