//
//  FavoriteModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import Foundation

class FavoriteModel {
    
    weak var delegate: FavoriteModelDelegate?
    
    var articles: [ArticleDataModel]!
    
    let storageService: CoreDataServiceProtocol
    
    init(delegate: FavoriteModelDelegate? = nil) {
        self.delegate = delegate
        self.storageService = ServiceProvider.coreDataService()
    }
}
