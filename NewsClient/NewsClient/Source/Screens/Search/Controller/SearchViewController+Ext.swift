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
            title: AppStrings.AlertController_error_title.localized,
            message: message,
            preferredStyle: .alert
        )
        
        let okAletalertAction = UIAlertAction(
            title: AppStrings.AlertController_okAletalertAction.localized,
            style: .default) { (action) in
            // ...
        }
        
        alertController.addAction(okAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func totalResult(is count: Int) {
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

//MARK: UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let searchString = searchBar.searchTextField.text!.trimmingCharacters(in: .whitespaces)
        
        keywordStr = searchString
        
        if !keywordStr.isEmpty {
            
            if serchDataSource.contains(searchString) {
                
                if let index = serchDataSource.firstIndex(of: searchString) {
                    
                    serchDataSource.remove(at: index)
                }
            }
            
            serchDataSource.insert(searchString, at: 0)
            DefaultManager.setSearchKeywords(serchDataSource)
        }
        
        if serchDataSource.count > 10 {
            serchDataSource.removeLast()
        }
        
        model.loadDataFor(keyword: keywordStr)
        
        navigationItem.searchController?.dismiss(animated: true)
        
        resultsTableController.tableView.reloadData()
        
        contentView.activityIndicatorStartAnimating()
    }
}

//MARK: UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewForHeaderInSection = SearchInfoView()
        
        viewForHeaderInSection.delegate = self
        
        if serchDataSource.count == 0 {

            viewForHeaderInSection.setupTitle(
                AppStrings.SearchViewController_HeaderView_No_recent_searches.localized
            )
            
            viewForHeaderInSection.showClearButton(false)
        } else {

            viewForHeaderInSection.setupTitle(
                AppStrings.SearchViewController_HeaderView_Recent_searches.localized
            )
            
            viewForHeaderInSection.showClearButton(true)
        }
        
        return viewForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return Constants.SearchInfoView_Height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let searchString = serchDataSource[indexPath.row]
        keywordStr = searchString
        
        model.loadDataFor(keyword: keywordStr)

        navigationItem.searchController?.dismiss(animated: true)
        
        contentView.activityIndicatorStartAnimating()
    }
}

//MARK: UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serchDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        
        cell.textLabel?.text = serchDataSource[indexPath.row]
         
        return cell
    }
}
