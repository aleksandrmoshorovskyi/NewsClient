//
//  TopViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import UIKit

//TopModelDelegate
extension TopViewController: TopModelDelegate {
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
}

//TopViewDelegate
extension TopViewController: TopViewDelegate {
    
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
