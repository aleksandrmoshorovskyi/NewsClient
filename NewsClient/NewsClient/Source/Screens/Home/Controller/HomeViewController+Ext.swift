//
//  HomeViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import UIKit

// MARK: NewsViewControllerDelegate
extension HomeViewController: NewsViewControllerDelegate {
    
    func newsDidTap(_ article: ArticleDataModel) {
        
        if let nc = navigationController {
            
            let newsDetailsViewController = NewsDetailsViewController()
            newsDetailsViewController.dataModel = article
              
            nc.pushViewController(newsDetailsViewController, animated: true)
        }
    }
}

// MARK: HomeModelDelegate
extension HomeViewController: HomeModelDelegate {
    
    func dataDidLoad(with viewControllers: [NewsViewController], for categories: [Category]) {
        contentView.setupViewControllers(data: viewControllers, and: categories)
    }
}

// MARK: HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
   
    func categoryDidChange(_ index: Int) {
        contentView.scrollToViewController(index: index)
    }
}
