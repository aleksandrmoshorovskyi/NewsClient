//
//  NewsModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation
import UIKit

// MARK: NewsModelProtocol
extension NewsModel: NewsModelProtocol {
    
    func getPlaceholderData() -> PlaceholderDataModel {
        return PlaceholderDataModel(
            imageSystemName: "magnifyingglass",
            titleText: getTextForTitlePlaceholderLabel(),
            descriptionText: getTextForDescriptionPlaceholderLabel(),
            buttonTitle: getButtonTitle(),
            buttonActionCompletion: buttonAction
        )
    }
    
    func updateFavorites() {
        
        if let data = articles {
            
            if data.count > 0 {
                let articles = updateFavoritesFor(articles: data)
                
                self.delegate?.dataDidUpdated(with: articles)
            }
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
    
    func loadDataFor(category: Category? = nil) {
        
        articles = []
        page = 1
        
        loadDataFor(category: category, page: page)
    }
    
    func prefetchDataFor(category: Category) {
        
        page += 1
        let notWholePage = totalResults % Constants.common_pageSizeDefaultValue == 0 ? 0 : 1
        
        if (totalResults / Constants.common_pageSizeDefaultValue) + notWholePage >= page {
            loadDataFor(category: category, page: page)
        }
    }
    
    func loadDataFor(category: Category? = nil, page: Int?) {
        
        var currentCountry: Country!
        
        if let appCountry = DefaultManager.getAppCountry() {
            currentCountry = appCountry
        } else {
            currentCountry = Country.Ukraine
        }
        
        currentCategory = category
        
        if let p = page {
            debugPrint("page - \(p)")
        }
        
        let pageSize = Constants.common_pageSizeDefaultValue
        
        networkService.loadTopNewsFor(country: currentCountry, category: category, keyword: nil, pageSize: pageSize, page: page) { [weak self] newsData, error in
            
            self?.currentError = nil

            if let err = error {
                debugPrint("\(err.localizedDescription)")
                
                self?.currentError = err
                
                DispatchQueue.main.async {
                    
                    if category == Category.allCases.first {
                        //self?.delegate?.presentAlert(with: "\(err.localizedDescription)")
                        self?.delegate?.presentAlert(
                            title: AppStrings.AlertController_error_title.localized,
                            message: err.localizedDescription
                        )
                    }
                    
                    if let p = page {
                        if p == 1 {
                            self?.delegate?.dataDidLoad(with: [])
                        } else {
                            //self?.delegate?.presentAlert(with: "\(err.localizedDescription)")
                            self?.delegate?.presentAlert(
                                title: AppStrings.AlertController_error_title.localized,
                                message: err.localizedDescription
                            )
                        }
                    }

                }
    
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                    
                    //DispatchQueue.main.async {
                        self?.delegate?.dataDidLoad(with: [])
                        //self?.delegate?.presentAlert(with: data.code ?? "Somthing went wrong...")
                        self?.delegate?.presentAlert(
                            title: AppStrings.AlertController_error_title.localized,
                            message: data.code ?? "Somthing went wrong..."
                        )
                    //}
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
                        let articlesWithFavorite = self?.updateFavoritesFor(articles: articlesData)
                        
                        self?.delegate?.dataDidLoad(with: articlesWithFavorite ?? [])
                    } else {
                        self?.delegate?.dataDidLoad(with: [])
                    }
                
                    //self?.delegate?.dataDidLoad(with: self?.articles)
                }
            }
        }
    }
    
    private func getTextForTitlePlaceholderLabel() -> NSAttributedString {
        
        let attributedText = NSAttributedString(
            string: AppStrings.NewsViewController_Placeholder_titleText.localized
        )
        
        return attributedText
    }
    
    private func getTextForDescriptionPlaceholderLabel() -> NSAttributedString {
        
        let attributedText = NSAttributedString(
            string: AppStrings.NewsViewController_Placeholder_descriptionText.localized
        )
        
        return attributedText
    }
    
    private func getButtonTitle() -> String {
        
        let str = AppStrings.NewsViewController_Placeholder_buttonTitle.localized
        
        return str
    }
    
    func buttonAction() {
        NotificationCenter.default.post(
            name: Constants.updateAfterErrorNotification,
            object: self,
            userInfo: nil
        )
    }
}
