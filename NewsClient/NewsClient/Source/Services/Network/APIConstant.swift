//
//  APIConstant.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

struct APIConstant {
    
    private static let baseUrl = "https://newsapi.org"
    
    private static let apiVersion = "v2"
    
    private static let dataPathTop = "/top-headlines"
    private static let dataPathSearch = "/everything"
    
    static let APIkey = "c3494c6294fc41dc8cca8fcf13d5987b"
    
    private static func baseNewsUrl() -> String {
        return baseUrl + "/" + apiVersion
    }
    
    static func topNewsUrl() -> String {
        return baseNewsUrl() + dataPathTop
    }
    
    static func searchNewsUrl() -> String {
        return baseNewsUrl() + dataPathSearch
    }
}

/*
 //Get curated breaking news headlines
 https://newsapi.org /v2/ top-headlines ?country=ua & apiKey=c3494c6294fc41dc8cca8fcf13d5987b
 
 //Searching for news articles
 https://newsapi.org /v2/ everything ?q=tesla & from=2024-05-05 & apiKey=c3494c6294fc41dc8cca8fcf13d5987b
 */
