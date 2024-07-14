//
//  SettingsModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

class SettingsModel {
    
    weak var delegate: SettingsModelDelegate?
    
//    let networkService: NetworkServiceProtocol
//    let storageService: CoreDataServiceProtocol
    
    init(delegate: SettingsModelDelegate? = nil) {
        self.delegate = delegate
//        self.networkService = ServiceProvider.networkService()
//        self.storageService = ServiceProvider.coreDataService()
    }
}
