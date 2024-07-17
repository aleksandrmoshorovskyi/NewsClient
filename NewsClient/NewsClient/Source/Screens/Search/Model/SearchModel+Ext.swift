//
//  SearchModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import UIKit

// MARK: SearchModelProtocol
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
        let notWholePage = totalResults % Constants.common_pageSizeDefaultValue == 0 ? 0 : 1
        
        if (totalResults / Constants.common_pageSizeDefaultValue) + notWholePage >= page {
            loadDataFor(keyword: keyword, page: page)
        }
    }
    
    func updateFavorites() {
        
        if let data = articles {
            let articles = updateFavoritesFor(articles: data)
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
            self.delegate?.totalResult(is: 0)
            return
        }
        
        if let p = page {
            debugPrint("page - \(p)")
        }
        
        let pageSize = Constants.common_pageSizeDefaultValue
        
        networkService.loadSearchedNewsFor(keyword: keyword, pageSize: pageSize, page: page) { [weak self] newsData, error in
            
            if let err = error {

                DispatchQueue.main.async {
                    debugPrint("\(err.localizedDescription)")
                    self?.delegate?.presentAlert(with: "\(err.localizedDescription)")
                }
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                    self?.delegate?.presentAlert(with: data.code ?? "Somthing went wrong...")
                }
                
                if data.status == "ok" {
                    //converte to local data model
                    debugPrint("totalResults - \(data.totalResults ?? 0)")
                    self?.totalResults = data.totalResults
                    self?.delegate?.totalResult(is: data.totalResults ?? 0)
                    
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
        
        let attributedText = NSAttributedString(
            string: AppStrings.SearchViewController_Placeholder_titleText.localized
        )
        
        return attributedText
    }
    
    private func getTextForDescriptionPlaceholderLabel() -> NSAttributedString {
        
        let attributedText = NSAttributedString(
            string: AppStrings.SearchViewController_Placeholder_descriptionText.localized
        )
        
        return attributedText
    }
}
