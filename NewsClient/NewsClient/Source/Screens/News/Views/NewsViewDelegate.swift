//
//  NewsViewDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

protocol NewsViewDelegate: AnyObject {
    
    func addToFavorite(article: ArticleDataModel)
    func deleteFromFavorite(article: ArticleDataModel)
    //func categoryDidChange(_ item: Category?)
    func categoryDidChange(_ index: Int)
    func newsRowDidTapAt(_ article: ArticleDataModel)
    func loadNextPageIfExists()
    func refreshData()
   // func presentAlert()
    func share(article: ArticleDataModel)
}
