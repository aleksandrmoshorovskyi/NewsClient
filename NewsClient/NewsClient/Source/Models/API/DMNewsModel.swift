//
//  DMNewsModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

struct DMNewsModel: Decodable {
    
    let status: String?
    
    // for error {
    let code: String?
    let message: String?
    //}
    
    let totalResults: Int?
    let articles: [Articles]?
    
    struct Articles: Decodable {
        
        let source: Source?
        let author: String?
        let title: String?
        let description: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String?
        let content: String?
        
        struct Source: Decodable {
            let id: String?
            let name: String?
        }
    }
}
