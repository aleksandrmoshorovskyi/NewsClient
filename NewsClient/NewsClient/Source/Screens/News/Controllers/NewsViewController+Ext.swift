//
//  NewsViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

// MARK: NewsModelDelegate
extension NewsViewController: NewsModelDelegate {
    
    func presentAlert(title: String, message: String) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAletalertAction = UIAlertAction(
            title: AppStrings.AlertController_okAletalertAction.localized,
            style: .default) {_ in }
        
        alertController.addAction(okAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
    
    func dataDidUpdated(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
}

// MARK: NewsViewDelegate
extension NewsViewController: NewsViewDelegate {
    
    func share(article: ArticleDataModel) {
        CommonFunctions.share(article: article, for: self)
    }
    
    func refreshData() {
        if let currentCategory = currentCategory {
            model.loadDataFor(category: currentCategory)
        } else {
            contentView.stopRefreshing()
        }
    }
    
    func loadNextPageIfExists() {
        if let currentCategory = currentCategory {
            model.prefetchDataFor(category: currentCategory)
        }
    }
    
    func deleteFromFavorite(article: ArticleDataModel) {
        model.deleteFavorite(article: article)
    }
    
    func addToFavorite(article: ArticleDataModel) {
        model.addFavorite(article: article)
    }
    
    func newsRowDidTapAt(_ article: ArticleDataModel) {
        
        delegate?.newsDidTap(article)
    }

    func categoryDidChange(_ index: Int) {
        //code
    }
    
    func categoryDidChange(_ item: Category?) {
        
        if currentCategory != item {
            model.loadDataFor(category: item)
        }
        
        currentCategory = item
    }
}
