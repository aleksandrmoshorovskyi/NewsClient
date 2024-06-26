//
//  FavoriteModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import Foundation

extension FavoriteModel: FavoriteModelProtocol {
    
    func loadData() {
    
        var articles: [ArticleDataModel] = []
        
        let storedArticles = storageService.fetchAllArticles()
        
        articles = storedArticles.compactMap() {
            ArticleDataModel(
                isFavorite: true,
                id: $0.id ?? "",
                author: $0.author,
                title: $0.title,
                descriptionString: $0.description,
                url: $0.url,
                urlToImage: $0.urlToImage,
                publishedAt: $0.publishedAt,
                content: $0.content)//,
                //addToFavoriteActionCompletion: nil,
                //deleteFromFavoriteActionCompletion: deleteFavorite)
        }
        
        self.delegate?.dataDidLoad(with: articles)
    }
    
    func deleteFavorite(article: ArticleDataModel) {
        
        self.storageService.deleteArticle(article: article)
    }
    
    func addToFavorite(article: ArticleDataModel) {
        
        self.storageService.insertArticle(article: article)
    }
}
