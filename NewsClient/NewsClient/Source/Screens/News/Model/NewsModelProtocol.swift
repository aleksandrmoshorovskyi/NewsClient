//
//  NewsModelProtocol.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

protocol NewsModelProtocol {
    
    func updateFavorites()
    
    func loadDataFor(category: Category?)
    func prefetchDataFor(category: Category)
    
    func addFavorite(article: ArticleDataModel)
    func deleteFavorite(article: ArticleDataModel)
    
    func getPlaceholderData() -> PlaceholderDataModel
}
