//
//  HomeViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import Foundation

extension HomeViewController: NewsViewControllerDelegate {
    
    func newsDidTap(_ article: ArticleDataModel) {
        debugPrint("newsDidTap")
        
        if let nc = navigationController {
            
            let newsDetailsViewController = NewsDetailsViewController()
            //newsDetailsViewController.contentView.setupNews(data: article)
            newsDetailsViewController.dataModel = article
              
            nc.pushViewController(newsDetailsViewController, animated: true)
        }
    }
}
