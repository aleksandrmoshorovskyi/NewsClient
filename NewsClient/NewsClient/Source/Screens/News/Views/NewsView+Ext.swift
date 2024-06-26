//
//  NewsView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

extension NewsView: NewsViewProtocol {
    
    func setupNews(data: [ArticleDataModel]) {
        
        dataSource = data
        
        collectionView.reloadData()
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
    
    func deleteFromFavorite(article: ArticleDataModel) {
        delegate?.deleteFromFavorite(article: article)
    }
    
    func addToFavorite(article: ArticleDataModel) {
        delegate?.addToFavorite(article: article)
    }
}
