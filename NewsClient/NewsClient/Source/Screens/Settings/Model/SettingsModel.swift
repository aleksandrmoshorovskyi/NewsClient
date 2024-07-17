//
//  SettingsModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

class SettingsModel {
    
    weak var delegate: SettingsModelDelegate?
    
    init(delegate: SettingsModelDelegate? = nil) {
        self.delegate = delegate
    }
}
