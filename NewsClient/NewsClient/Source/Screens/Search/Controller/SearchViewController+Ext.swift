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
        
        DefaultManager.removeSearchKeywords()
        
        serchDataSource = DefaultManager.getSearchKeywords() ?? []
        
        resultsTableController.tableView.reloadData()
    }
}

//MARK: SearchModelDelegate
extension SearchViewController: SearchModelDelegate {
    
    func presentAlert(with message: String) {
        
        let alertController = UIAlertController(
            //title: "error".localized().capitalized,
            title: AppStrings.AlertController_error_title.localized,
            message: message,
            preferredStyle: .alert
        )
        
        let okAletalertAction = UIAlertAction(
            //title: "OK",
            title: AppStrings.AlertController_okAletalertAction.localized,
            style: .default) { (action) in
            // ...
        }
        
        alertController.addAction(okAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func totalResult(is count: Int) {
        //navigationItem.prompt = "\(count)" + " " + "results for".localized() + " - " + "\(keywordStr ?? "")"
        navigationItem.prompt = ""
        navigationItem.prompt?.append("\(count)")
        navigationItem.prompt?.append(" ")
        navigationItem.prompt?.append(AppStrings.SearchViewController_navigationItem_prompt_result.localized)
        navigationItem.prompt?.append(" - ")
        navigationItem.prompt?.append("\(keywordStr ?? "")")
        navigationItem.titleView?.reloadInputViews()
    }
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
}

//MARK: NewsViewDelegate
extension SearchViewController: NewsViewDelegate {
    
    func share(article: ArticleDataModel) {
        CommonFunctions.share(article: article, for: self)
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
        
        NotificationCenter.default.post(
            name: Constants.addedToFavoriteNotification,
            object: article,
            userInfo: nil
        )
    }
    
    func deleteFromFavorite(article: ArticleDataModel) {
        
        model.deleteFavorite(article: article)
        
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
