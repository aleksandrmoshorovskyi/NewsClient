//
//  ArticleDataModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import Foundation

struct ArticleDataModel {
    
    var isFavorite: Bool
    let id: String
    let author: String?
    let title: String?
    let descriptionString: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    var addToFavoriteActionCompletion: ((ArticleDataModel) -> ())?
    var deleteFromFavoriteActionCompletion: ((ArticleDataModel) -> ())?
}
