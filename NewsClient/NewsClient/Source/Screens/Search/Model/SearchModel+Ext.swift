//
//  SearchModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation
//import UIKit

extension SearchModel: SearchModelProtocol {
    
    func getPlaceholderData() -> PlaceholderDataModel {
        return PlaceholderDataModel(
            imageSystemName: "magnifyingglass",
            titleText: getTextForTitlePlaceholderLabel(),
            descriptionText: getTextForDescriptionPlaceholderLabel()
        )
    }
    
    func loadDataFor(keyword: String) {
        
        articles = []
        page = 1
        
        loadDataFor(keyword: keyword, page: page)
    }
    
    func prefetchDataFor(keyword: String) {
        
        page += 1
        let notWholePage = totalResults % Constants.pageSizeDefaultValue == 0 ? 0 : 1
        
        if (totalResults / Constants.pageSizeDefaultValue) + notWholePage >= page {
            loadDataFor(keyword: keyword, page: page)
        }
    }
    
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
    
    private func loadDataFor(keyword: String, page: Int?) {
        
        if keyword.isEmpty {
            self.delegate?.dataDidLoad(with: [])
        }
        
        if let p = page {
            debugPrint("page - \(p)")
        }
        
        let pageSize = Constants.pageSizeDefaultValue
        
        networkService.loadSearchedNewsFor(keyword: keyword, pageSize: pageSize, page: page) { [weak self] newsData, error in
            
            if let err = error {
                debugPrint("\(err.localizedDescription)")
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                }
                
                if data.status == "ok" {
                    //converte to local data model
                    debugPrint("totalResults - \(data.totalResults ?? 0)")
                    self?.totalResults = data.totalResults
                    
                    if let dataArticles = data.articles {
                        self?.articles += dataArticles.compactMap() {
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
                        //let filteredArticles = articlesData.filter() { $0.title != "[Removed]" }
                        //let sortedArticles = filteredArticles.sorted() { $0.publishedAt ?? "" > $1.publishedAt ?? "" }
                        
                        let articlesWithFavorite = self?.updateFavoritesFor(articles: articlesData)
                        
                        self?.delegate?.dataDidLoad(with: articlesWithFavorite ?? [])
                    } else {
                        self?.delegate?.dataDidLoad(with: [])
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
    
    private func getTextForTitlePlaceholderLabel() -> NSAttributedString {
        
        let attributedText = NSAttributedString(string: "Find it on NEWS".localized())
        
        return attributedText
    }
    
    private func getTextForDescriptionPlaceholderLabel() -> NSAttributedString {
        
        let attributedText = NSAttributedString(string: "Type your query to search from NEWS".localized())
        
        return attributedText
    }
}

/*
 private func loadDataFor(keyword: String, page: Int?) {
     
     if let p = page {
         debugPrint("page - \(p)")
     }
     
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
                 debugPrint("totalResults - \(data.totalResults ?? 0)")
                 self?.totalResults = data.totalResults
                 
                 if let dataArticles = data.articles {
                     self?.articles += dataArticles.compactMap() {
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
 */
