//
//  HomeView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

//MARK: HomeViewProtocol
extension HomeView: HomeViewProtocol {
    
    func setupViewControllers(data: [NewsViewController], and categories: [Category]) {
        
        dataSource = data
        categoriesSource = categories
        
        collectionView.reloadData()
    }
    
    func scrollToViewController(index: Int) {
        
        let indexPath = IndexPath(row: index, section: 0)
        
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
}

//MARK: CategoryViewDelegate
extension HomeView: CategoryViewDelegate {
    
    func categoryAtIndexDidTap(_ index: Int) {
        delegate?.categoryDidChange(index)
    }
    
    func categoryDidTap(_ item: Category?) {
        //delegate?.categoryDidChange(item)
    }
}
