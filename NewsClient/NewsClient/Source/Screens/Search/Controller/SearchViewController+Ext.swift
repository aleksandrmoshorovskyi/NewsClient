//
//  SearchViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation

//MARK: SearchModelDelegate
extension SearchViewController: SearchModelDelegate {
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
}

//MARK: NewsViewDelegate
extension SearchViewController: NewsViewDelegate {
    
    func addToFavorite(article: ArticleDataModel) {
        model.addFavorite(article: article)
        model.loadDataFor(keyword: "Apple")
        
        NotificationCenter.default.post(
            name: Constants.addedToFavoriteNotification,
            object: article,
            userInfo: nil
        )
    }
    
    func deleteFromFavorite(article: ArticleDataModel) {
        model.deleteFavorite(article: article)
        model.loadDataFor(keyword: "Apple")
        
        NotificationCenter.default.post(
            name: Constants.deletedFromFavoriteNotification,
            object: article,
            userInfo: nil
        )
    }
    
    func categoryDidChange(_ index: Int) {
        //
    }
    
    func newsRowDidTapAt(_ article: ArticleDataModel) {
        if let nc = navigationController {
            
            let newsDetailsViewController = NewsDetailsViewController()
            newsDetailsViewController.dataModel = article
            newsDetailsViewController.dataModel.addToFavoriteActionCompletion = addToFavorite
            newsDetailsViewController.dataModel.deleteFromFavoriteActionCompletion = deleteFromFavorite
              
            nc.pushViewController(newsDetailsViewController, animated: true)
        }
    }
}
