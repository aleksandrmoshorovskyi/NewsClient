//
//  NewsDetailsView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import Foundation

extension NewsDetailsView: NewsDetailsViewProtocol {
    
    func setupNews(data: ArticleDataModel) {
        
        dataSource = data
        
        if let urlToArticle = dataSource.url {
            
            if let url = URL(string: urlToArticle) {
                
                let request = URLRequest(url: url)
                
                webView.load(request)
            }
        }
    }
}
