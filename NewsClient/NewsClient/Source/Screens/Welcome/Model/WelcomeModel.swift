//
//  WelcomeModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import Foundation

class WelcomeModel {
    
    weak var delegate: WelcomeModelDelegate?
    
//    let networkService: NetworkServiceProtocol
//    let storageService: CoreDataServiceProtocol
    
    init(delegate: WelcomeModelDelegate? = nil) {
        self.delegate = delegate
//        self.networkService = ServiceProvider.networkService()
//        self.storageService = ServiceProvider.coreDataService()
    }
}
