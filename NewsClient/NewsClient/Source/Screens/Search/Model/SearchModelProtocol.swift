//
//  SearchModelProtocol.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import Foundation

protocol SearchModelProtocol {
    
    func loadDataFor(keyword: String)//, page: Int?)
    
    func prefetchDataFor(keyword: String)
    
    func addFavorite(article: ArticleDataModel)
    
    func deleteFavorite(article: ArticleDataModel)
    
    func getPlaceholderData() -> PlaceholderDataModel
}

//extension SearchModelProtocol {
//    func loadDataFor(keyword: String, page: Int? = 1) {
//        return loadDataFor(keyword: keyword, page: page)
//    }
//}

/*
 import UIKit

 protocol TestProtocol {
     func testFunction(a: Int, b: Int?) -> String
 }

 extension TestProtocol
 {
     func testFunction(a: Int, b: Int? = nil) -> String {
         return testFunction(a: a, b: b)
     }
 }
 */
