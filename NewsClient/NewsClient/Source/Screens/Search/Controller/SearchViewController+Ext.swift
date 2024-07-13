//
//  SearchViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation
import UIKit

//MARK: SearchInfoViewDelegate
extension SearchViewController: SearchInfoViewDelegate {
    
    func clearButtonDidTap() {
        //debugPrint("clearButtonDidTap")
        
        DefaultManager.removeSearchKeywords()
        serchDataSource = DefaultManager.getSearchKeywords() ?? []
        resultsTableController.tableView.reloadData()
    }
}

//MARK: SearchModelDelegate
extension SearchViewController: SearchModelDelegate {
    func presentAlert(with message: String) {
        
        let alertController = UIAlertController(
            title: "error".localized().capitalized,
            message: message,
            preferredStyle: .alert
        )
        
        let okAletalertAction = UIAlertAction(
            title: "OK",
            style: .default) { (action) in
            // ...
        }
        
        alertController.addAction(okAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func totalResult(is count: Int) {
        navigationItem.prompt = "\(count)" + " " + "results for".localized() + " - " + "\(keywordStr ?? "")"
        navigationItem.titleView?.reloadInputViews()
    }
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        
//        if data.count > 0 {
//            navigationItem.prompt = "\(99) results for - \(keywordStr ?? "")"
//        } else {
//            navigationItem.prompt = nil
//        }
        
//        if data.count == 0 {
//            navigationItem.prompt = nil
//        }
        
        contentView.setupNews(data: data)
    }
}

//MARK: NewsViewDelegate
extension SearchViewController: NewsViewDelegate {
    
    func share(article: ArticleDataModel) {
        
        if let urlToArticle = article.url {
            if let url = URL(string: urlToArticle) {
                let urlToShare = [url]
                
                let activityViewController = UIActivityViewController(
                    activityItems: urlToShare,
                    applicationActivities: nil
                )
                
                activityViewController.popoverPresentationController?.sourceView = self.view
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
    
    func presentAlert() {
        //
    }
    
    func refreshData() {
        if let keywordStr = keywordStr {
            model.loadDataFor(keyword: keywordStr)
        } else {
            contentView.stopRefreshing()
        }
    }
    
    func loadNextPageIfExists() {
        model.prefetchDataFor(keyword: keywordStr)
    }
    
    
    func addToFavorite(article: ArticleDataModel) {
        model.addFavorite(article: article)
        //model.loadDataFor(keyword: "Apple")
        
        NotificationCenter.default.post(
            name: Constants.addedToFavoriteNotification,
            object: article,
            userInfo: nil
        )
    }
    
    func deleteFromFavorite(article: ArticleDataModel) {
        model.deleteFavorite(article: article)
        //model.loadDataFor(keyword: "Apple")
        
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
