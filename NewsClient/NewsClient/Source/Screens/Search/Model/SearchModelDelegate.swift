//
//  SearchModelDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation

protocol SearchModelDelegate: AnyObject {
    
    func dataDidLoad(with data: [ArticleDataModel])
}