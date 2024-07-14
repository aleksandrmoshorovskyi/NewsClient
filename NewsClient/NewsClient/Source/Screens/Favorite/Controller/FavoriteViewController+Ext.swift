//
//  FavoriteViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import Foundation
import UIKit

//MARK: FavoriteModelDelegate
extension FavoriteViewController: FavoriteModelDelegate {
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
}

//MARK: NewsViewDelegate
extension FavoriteViewController: NewsViewDelegate {
    
    func share(article: ArticleDataModel) {
        CommonFunctions.share(article: article, for: self)
    }
    
    
    func presentAlert() {
        //
    }
    
    func refreshData() {
        navigationItem.searchController?.searchBar.searchTextField.text = ""
        model.loadData()
    }
    
    func loadNextPageIfExists() {
        //
    }
    
    func addToFavorite(article: ArticleDataModel) {
        model.addToFavorite(article: article)
        model.loadData()
        
        NotificationCenter.default.post(
            name: Constants.addedToFavoriteNotification,
            object: article,
            userInfo: nil
        )
    }
    
    func deleteFromFavorite(article: ArticleDataModel) {
        model.deleteFavorite(article: article)
        model.loadData()
        
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
