//
//  ArticleCollectionViewCellDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import Foundation

protocol ArticleCollectionViewCellDelegate: AnyObject {
    
    func addToFavorite(article: ArticleDataModel)
    func deleteFromFavorite(article: ArticleDataModel)
}
