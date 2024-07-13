//
//  NewsViewProtocol.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

protocol NewsViewProtocol {
    
    func setupNews(data: [ArticleDataModel])
    func stopRefreshing()
    
    func activityIndicatorStartAnimating()
    func activityIndicatorStopAnimating()
    
    func setupPlaceholderData(data: PlaceholderDataModel)
    func showPlaceholder()
    func hidePlaceholder()
    
    //func getPlaceholderData() -> PlaceholderDataModel
}
