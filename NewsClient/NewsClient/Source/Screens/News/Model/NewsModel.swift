//
//  NewsModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

class NewsModel {
    
    weak var delegate: NewsModelDelegate?
    
    var currentCategory: Category?
    var currentError: Error?
    var articles: [ArticleDataModel]!
    var totalResults: Int!
    var page: Int!
    
    let networkService: NetworkServiceProtocol
    let storageService: CoreDataServiceProtocol
    
    init(delegate: NewsModelDelegate? = nil) {
        self.delegate = delegate
        self.networkService = ServiceProvider.networkService()
        self.storageService = ServiceProvider.coreDataService()
    }
}