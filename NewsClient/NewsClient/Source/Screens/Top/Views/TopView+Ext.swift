//
//  TopView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import Foundation

extension TopView: TopViewProtocol {
    
    func setupNews(data: [ArticleDataModel]) {
        
        dataSource = data
        
        collectionView.reloadData()
    }
}
