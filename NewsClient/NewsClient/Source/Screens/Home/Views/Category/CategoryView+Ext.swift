//
//  CategoryView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import UIKit

// MARK: CategoryViewProtocol
extension CategoryView: CategoryViewProtocol {
    
    func scrollToCategory(indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
    
    func setupCategory(index: Int) {
        
        selectedIndex = index
        
        collectionView.reloadData()
    }
}
