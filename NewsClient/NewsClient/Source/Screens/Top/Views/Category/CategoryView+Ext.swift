//
//  CategoryView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import Foundation

extension CategoryView: CategoryViewProtocol {
    
    func setupCategory(data: [String]) {
        
        //dataSource = data
        
        collectionView.reloadData()
    }
}
