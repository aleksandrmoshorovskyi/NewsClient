//
//  NewsModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

extension NewsModel: NewsModelProtocol {
    
    func getPlaceholderData() -> PlaceholderDataModel {
        return PlaceholderDataModel(
            imageSystemName: "magnifyingglass",
            titleText: getTextForTitlePlaceholderLabel(),
            descriptionText: getTextForDescriptionPlaceholderLabel(),
            buttonTitle: getButtonTitle(),
            //buttonAction: #selector(buttonAction),
            buttonActionCompletion: buttonAction
        )
    }
    
    func articleDidDeleteFromFavorite(notification: Notification) {
        //
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
        let notWholePage = totalResults % Constants.pageSizeDefaultValue == 0 ? 0 : 1
        
        if (totalResults / Constants.pageSizeDefaultValue) + notWholePage >= page {
            loadDataFor(category: category, page: page)
        }
    }
    
    //func loadDataFor(_ category: Category? = nil) {
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
        
        let pageSize = Constants.pageSizeDefaultValue
        
        networkService.loadTopNewsFor(country: currentCountry, category: category, keyword: nil, pageSize: pageSize, page: page) { [weak self] newsData, error in
            
            self?.currentError = nil

            if let err = error {
                debugPrint("\(err.localizedDescription)")
                
                //Call must be made on main thread!!!
                //self?.delegate?.presentAlertWith("error".localized().capitalized, err.localizedDescription)
                
                self?.currentError = err
                
                DispatchQueue.main.async {
                    //self?.delegate?.dataDidLoad(with: [])
                    //self?.delegate?.presentAlert(with: "\(err.localizedDescription)")
                    //SHOW ON PLACEHOLDER ->
                    
                    if category == Category.allCases.first {
                        self?.delegate?.presentAlert(with: "\(err.localizedDescription)")
                    }
                    
                    if let p = page {
                        if p == 1 {
                            self?.delegate?.dataDidLoad(with: [])
                        } else {
                            self?.delegate?.presentAlert(with: "\(err.localizedDescription)")
                        }
                    }
                    
                    //TO DO - Some error
                    //currentError = err
                }
    
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                    
                    //Call must be made on main thread!!!
                    //self?.delegate?.presentAlertWith("error".localized().capitalized, "\(String(describing: data.code))")
                    //self?.delegate?.dataDidLoad(with: [])
                    
                    //DispatchQueue.main.async {
                        self?.delegate?.dataDidLoad(with: [])
                        self?.delegate?.presentAlert(with: data.code ?? "Somthing went wrong...")
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
        
        let attributedText = NSAttributedString(string: "OOOPS...".localized())
        
        return attributedText
    }
    
    private func getTextForDescriptionPlaceholderLabel() -> NSAttributedString {
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "Something went wrong.".localized()))
        attributedText.append(NSAttributedString(string: "\n"))
        attributedText.append(NSAttributedString(string: "Please, try again later.".localized()))
        
        return attributedText
    }
    
    private func getButtonTitle() -> String {
        
        let str = "Try again".localized()
        
        return str
    }
    
    //@objc 
    func buttonAction() {
        
        if let currentCategory = currentCategory {
            //loadDataFor(category: currentCategory)
            NotificationCenter.default.post(
                name: Constants.updateAfterErrorNotification,
                object: self,
                userInfo: nil
            )
        }
    }
}

/*
 func loadDataFor(_ category: Category? = nil) {
     
     var currentCountry: Country!
     
     if let appCountry = DefaultManager.getAppCountry() {
         currentCountry = appCountry
     } else {
         currentCountry = Country.Ukraine
     }
     
     networkService.loadTopNewsFor(country: currentCountry, category: category, keyword: nil, pageSize: nil, page: nil) { [weak self] newsData, error in

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
 */

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
