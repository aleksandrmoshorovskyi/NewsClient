//
//  SettingsModelDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

protocol SettingsModelDelegate: AnyObject {
    
    func dataDidLoad(with data: [SettingsDataModel])
}

