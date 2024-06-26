//
//  FavoriteModelProtocol.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import Foundation

protocol FavoriteModelProtocol {
    
    func loadData()
    func deleteFavorite(article: ArticleDataModel)
    func addToFavorite(article: ArticleDataModel)
}
