//
//  HomeModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

class HomeModel {
    
    weak var delegate: HomeModelDelegate?
    
    let networkService: NetworkServiceProtocol
    let storageService: CoreDataServiceProtocol
    
    init(delegate: HomeModelDelegate? = nil) {
        self.delegate = delegate
        self.networkService = ServiceProvider.networkService()
        self.storageService = ServiceProvider.coreDataService()
    }
}
