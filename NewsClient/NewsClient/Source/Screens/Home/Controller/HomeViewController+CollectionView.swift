//
//  HomeViewController+CollectionView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

extension HomeViewController: HomeModelDelegate {
    
    func dataDidLoad(with viewControllers: [NewsViewController]) {
        
        contentView.setupViewControllers(data: viewControllers)
    }
}

extension HomeViewController: HomeViewDelegate {
   
    func categoryDidChange(_ index: Int) {
        debugPrint("index - \(index)")
        contentView.scrollToViewController(index: index)
    }
    
    /*
    func categoryDidChange(_ item: Category?) {
        
        if currentCategory != item {
            model.loadDataFor(item)
        }
        
        currentCategory = item
    }
    
    func addToFavoriteDidTap() {
        
        //code
    }
     */
}
