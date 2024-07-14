//
//  NewsView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

extension NewsView: NewsViewProtocol {
    
    func showPlaceholder() {
        
        if let placeholderView = placeholderView {
            placeholderView.frame = frame
            addSubview(placeholderView)
        }
    }
    
    func hidePlaceholder() {
        
        if let placeholderView = placeholderView {
            placeholderView.frame = .zero
            placeholderView.removeFromSuperview()
        }
    }
    
    func setupPlaceholderData(data: PlaceholderDataModel) {
        
        placeholderData = data
        
        if let placeholderData = placeholderData {
            placeholderView = NewsPlaceholderView(placeholderData: placeholderData)
            //showPlaceholder()
        }
    }
    
    func activityIndicatorStartAnimating() {
        activityIndicator.startAnimating()
    }
    
    func activityIndicatorStopAnimating() {
        activityIndicator.stopAnimating()
    }
    
    func stopRefreshing() {
        refreshControl.endRefreshing()
    }
    
    func setupNews(data: [ArticleDataModel]) {
        
        dataSource = data
        
        if dataSource.count > 0 {
            hidePlaceholder()
        } else {
            showPlaceholder()
        }
        
        collectionView.reloadData()
        maxIndexPathRow = 0
        
        refreshControl.endRefreshing()
        activityIndicator.stopAnimating()
    }
}

extension NewsView: CategoryViewDelegate {
    
    func categoryAtIndexDidTap(_ index: Int) {
        delegate?.categoryDidChange(index)
    }
    
    
//    func categoryDidTap(_ item: Category?) {
//        delegate?.categoryDidChange(item)
//    }
}

extension NewsView: ArticleCollectionViewCellDelegate {
    
    func share(article: ArticleDataModel) {
        delegate?.share(article: article)
    }
    
    func deleteFromFavorite(article: ArticleDataModel) {
        delegate?.deleteFromFavorite(article: article)
    }
    
    func addToFavorite(article: ArticleDataModel) {
        delegate?.addToFavorite(article: article)
    }
}
