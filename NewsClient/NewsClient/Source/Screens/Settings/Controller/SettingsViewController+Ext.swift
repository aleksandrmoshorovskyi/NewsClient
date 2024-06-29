//
//  SettingsViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

//MARK: SettingsModelDelegate
extension SettingsViewController: SettingsModelDelegate {
    
    func dataDidLoad(with data: [SettingsDataModel]) {
        contentView.setupData(data: data)
    }
}

//MARK: SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
    
}
