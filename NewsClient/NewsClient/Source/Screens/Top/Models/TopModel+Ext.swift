//
//  TopModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

extension TopModel: TopModelProtocol {
    
    func loadDataFor(_ category: Category? = nil) {
        
        //debugPrint("\(category)")
        
        var articles: [ArticleDataModel] = []
        
        //networkService.loadSearchedNewsFor(keyword: "Intel", pageSize: 10, page: 1) { [weak self] newsData, error in
        networkService.loadTopNewsFor(country: Country.Ukraine, category: category, keyword: nil, pageSize: nil, page: nil) { [weak self] newsData, error in

            if let err = error {
                debugPrint("\(err.localizedDescription)")
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                }
                
                if data.status == "ok" {
                    //converte to local data model
                    
                    if let dataArticles = data.articles {
                        articles = dataArticles.compactMap() {
                            ArticleDataModel(
                                id: $0.id,
                                author: $0.author,
                                title: $0.title,
                                description: $0.description,
                                url: $0.url,
                                urlToImage: $0.urlToImage,
                                publishedAt: $0.publishedAt,
                                content: $0.content)
                        }
                    }
                
                    self?.delegate?.dataDidLoad(with: articles)
                }
            }
        }
    }
}
