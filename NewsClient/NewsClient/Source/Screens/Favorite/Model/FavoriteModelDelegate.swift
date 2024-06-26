//
//  FavoriteModelDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import Foundation

protocol FavoriteModelDelegate: AnyObject {
    
    func dataDidLoad(with data: [ArticleDataModel])
}
