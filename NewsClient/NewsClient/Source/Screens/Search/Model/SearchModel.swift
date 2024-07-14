//
//  SearchModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation

class SearchModel {
    
    weak var delegate: SearchModelDelegate?
    
    var articles: [ArticleDataModel]!
    var totalResults: Int!
    var page: Int!
    
    let networkService: NetworkServiceProtocol
    let storageService: CoreDataServiceProtocol
    
    init(delegate: SearchModelDelegate? = nil) {
        self.delegate = delegate
        self.networkService = ServiceProvider.networkService()
        self.storageService = ServiceProvider.coreDataService()
    }
}
