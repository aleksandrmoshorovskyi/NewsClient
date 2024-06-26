//
//  NewsModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

extension NewsModel: NewsModelProtocol {
    
    func articleDidDeleteFromFavorite(notification: Notification) {
        //
    }
    
    func updateFavorites() {
        
        if let data = articles {
            let articles = updateFavoritesFor(articles: data)
            
            self.delegate?.dataDidUpdated(with: articles)
        }
    }
    
    func updateFavoritesFor(articles: [ArticleDataModel]) -> [ArticleDataModel] {
        
        let storedArticles = self.storageService.fetchAllArticles()
        var articlesArray = articles
        
        articlesArray.enumerated().forEach { index, item in
            if !storedArticles.filter({ item.id == $0.id }).isEmpty {
                articlesArray[index].isFavorite = true
            }
        }
        
        return articlesArray
    }
    
    func addFavorite(article: ArticleDataModel) {
        self.storageService.insertArticle(article: article)
        self.updateFavorites()
        
        NotificationCenter.default.post(
            name: Constants.addedToFavoriteNotification,
            object: article,
            userInfo: nil
        )
    }
    
    func deleteFavorite(article: ArticleDataModel) {
        self.storageService.deleteArticle(article: article)
        self.updateFavorites()
        
        NotificationCenter.default.post(
            name: Constants.deletedFromFavoriteNotification,
            object: article,
            userInfo: nil
        )
    }
    
    
    func loadDataFor(_ category: Category? = nil) {
        
        //debugPrint("\(category)")
        
        //var articles: [ArticleDataModel] = []
        
        //networkService.loadSearchedNewsFor(keyword: "Intel", pageSize: 10, page: 1) { [weak self] newsData, error in
        networkService.loadTopNewsFor(country: Country.Ukraine, category: category, keyword: nil, pageSize: nil, page: nil) { [weak self] newsData, error in

            if let err = error {
                debugPrint("\(err.localizedDescription)")
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                }
                
                if data.status == "ok" {
                    //converte to local data model
                    
                    if let dataArticles = data.articles {
                        self?.articles = dataArticles.compactMap() {
                            ArticleDataModel(
                                isFavorite: false,
                                id: $0.id,
                                author: $0.author,
                                title: $0.title,
                                descriptionString: $0.description,
                                url: $0.url,
                                urlToImage: $0.urlToImage,
                                publishedAt: $0.publishedAt,
                                content: $0.content,
                                addToFavoriteActionCompletion: self?.addFavorite,
                                deleteFromFavoriteActionCompletion: self?.deleteFavorite
                            )
                        }
                    }
                    
                    if let articlesData = self?.articles {
                        let articlesWithFavorite = self?.updateFavoritesFor(articles: articlesData)
                        
                        self?.delegate?.dataDidLoad(with: articlesWithFavorite ?? [])
                    }
                
                    //self?.delegate?.dataDidLoad(with: self?.articles)
                }
            }
        }
    }
}

/*
import Foundation

extension NewsModel: NewsModelProtocol {
    
    func deleteFavorite(article: ArticleDataModel) {
        self.storageService.deleteArticle(article: article)
    }
    
    func addFavorite(article: ArticleDataModel) {
        self.storageService.insertArticle(article: article)
        self.updateFavorites()
    }
    
    func updateFavorites() {
        
        if let data = articles {
            let articles = updateFavoritesFor(articles: data)
            
            self.delegate?.dataDidUpdated(with: articles)
        }
    }
    
    func updateFavoritesFor(articles: [ArticleDataModel]) -> [ArticleDataModel] {
        
        let storedArticles = self.storageService.fetchAllArticles()
        var articlesArray = articles
        
        articlesArray.enumerated().forEach { index, item in
            if !storedArticles.filter({ item.idStr == $0.idStr }).isEmpty {
                articlesArray[index].isFavorite = true
            }
        }
        
        return articlesArray
    }
    
    func loadDataFor(_ category: Category? = nil) {
        
        //debugPrint("\(category)")
        
        //var articles: [ArticleDataModel] = []
        //articles = []
        
        //networkService.loadSearchedNewsFor(keyword: "Intel", pageSize: 10, page: 1) { [weak self] newsData, error in
        networkService.loadTopNewsFor(country: Country.Ukraine, category: category, keyword: nil, pageSize: nil, page: nil) { [weak self] newsData, error in

            if let err = error {
                debugPrint("\(err.localizedDescription)")
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                }
                
                if data.status == "ok" {
                    //converte to local data model
                    
                    if let dataArticles = data.articles {
                        self?.articles = dataArticles.compactMap() {
                            ArticleDataModel(
                                id: $0.id, 
                                idStr: ($0.author ?? "") + ($0.title ?? "") + ($0.url ?? ""),
                                isFavorite: false,
                                author: $0.author,
                                title: $0.title,
                                //description: $0.description,
                                url: $0.url,
                                urlToImage: $0.urlToImage,
                                publishedAt: $0.publishedAt)//,
                                //content: $0.content)
                        }
                    }
                    
                    if let articlesData = self?.articles {
                        let articlesWithFavorite = self?.updateFavoritesFor(articles: articlesData)
                        
                        self?.delegate?.dataDidLoad(with: articlesWithFavorite ?? [])
                    }
                    
                    //var articles = self?.updateFavoritesFor(articles: self?.articles) ?? self?.articles
                
                    //self?.delegate?.dataDidLoad(with: self?.articles ?? [])
                }
            }
        }
    }
}
 */
