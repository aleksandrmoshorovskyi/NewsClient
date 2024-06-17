//
//  NewsViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

//NewsModelDelegate
extension NewsViewController: NewsModelDelegate {
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
}

//NewsViewDelegate
extension NewsViewController: NewsViewDelegate {
    
    func categoryDidChange(_ index: Int) {
        //code
    }
    
    func categoryDidChange(_ item: Category?) {
        
        if currentCategory != item {
            model.loadDataFor(item)
        }
        
        currentCategory = item
    }
    
    func addToFavoriteDidTap() {
        //code
    }
}
