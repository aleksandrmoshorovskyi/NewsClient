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
    
    func addToFavoriteDidTap() {
        //code
    }
}
