//
//  TopModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

class TopModel {
    
    weak var delegate: TopModelDelegate?
    
    let networkService: NetworkServiceProtocol
    let storageService: CoreDataServiceProtocol
    
    init(delegate: TopModelDelegate? = nil) {
        self.delegate = delegate
        self.networkService = ServiceProvider.networkService()
        self.storageService = ServiceProvider.coreDataService()
    }
}
