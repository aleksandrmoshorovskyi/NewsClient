//
//  SearchModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation

extension SearchModel: SearchModelProtocol {
    
    func updateFavorites() {
        
        if let data = articles {
            let articles = updateFavoritesFor(articles: data)
            
            //self.delegate?.dataDidUpdated(with: articles)
            self.delegate?.dataDidLoad(with: articles)
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
    
    func loadDataFor(keyword: String) {
        
        networkService.loadSearchedNewsFor(keyword: keyword, pageSize: 20, page: 1) { [weak self] newsData, error in
            
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
                        
                        //delete Articles with title [Removed]
                        let filteredArticles = articlesData.filter() { $0.title != "[Removed]" }
                        let sortedArticles = filteredArticles.sorted() { $0.publishedAt ?? "" > $1.publishedAt ?? "" }
                        
                        let articlesWithFavorite = self?.updateFavoritesFor(articles: sortedArticles)
                        
                        self?.delegate?.dataDidLoad(with: articlesWithFavorite ?? [])
                    }
                }
            }
        }
        
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
}

/*
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
 */
