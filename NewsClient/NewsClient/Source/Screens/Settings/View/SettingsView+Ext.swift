//
//  SettingsView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

extension SettingsView: SettingsViewProtocol {
    
    func setupData(data: [SettingsDataModel]) {
        dataSource = data
        tableView.reloadData()
    }
}
