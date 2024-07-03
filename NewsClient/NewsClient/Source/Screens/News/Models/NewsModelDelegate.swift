//
//  NewsModelDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

protocol NewsModelDelegate: AnyObject {
    
    func dataDidLoad(with data: [ArticleDataModel])
    func dataDidUpdated(with data: [ArticleDataModel])
    func presentAlertWith(_ title: String, _ message: String)
}
