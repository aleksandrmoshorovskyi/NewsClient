//
//  SearchModelProtocol.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation

protocol SearchModelProtocol {
    
    func loadDataFor(keyword: String)
    func prefetchDataFor(keyword: String)
    
    func addFavorite(article: ArticleDataModel)
    func deleteFavorite(article: ArticleDataModel)
    
    func getPlaceholderData() -> PlaceholderDataModel
}
