//
//  NewsDetailsViewControllerDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import Foundation

protocol NewsDetailsViewControllerDelegate: AnyObject {

    func addToFavorite(article: ArticleDataModel)
    func deleteFromFavorite(article: ArticleDataModel)
}
