//
//  NetworkService+News.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation
//import UIKit

typealias NewsCompletion = ((DMNewsModel?, Error?) -> ())
typealias NewParametrs = (category: Category?, keyword: String?, pageSize: Int?, page: Int?)

protocol NetworkServiceNews {

    func loadTopNewsFor(country: Country, category: Category?, keyword: String?, pageSize: Int?, page: Int?, completion: @escaping NewsCompletion)
    func loadSearchedNewsFor(keyword: String, pageSize: Int?, page: Int?, completion: @escaping NewsCompletion)
}

extension NetworkService: NetworkServiceProtocol {
        
    func loadTopNewsFor(country: Country, category: Category?, keyword: String?, pageSize: Int?, page: Int?, completion: @escaping NewsCompletion) {
        
        let urlString = APIConstant.topNewsUrl() + "?" + "country=\(country.rawValue)"
        
        let urlStringWithParametrs = addParametrs((category, keyword, pageSize, page), for: urlString)

        loadData(for: urlStringWithParametrs, completion: completion)
    }
    
    func loadSearchedNewsFor(keyword: String, pageSize: Int?, page: Int?, completion: @escaping NewsCompletion) {
        
        let urlString = APIConstant.searchNewsUrl() + "?" + "q=\(keyword)"
        
        let urlStringWithParametrs = addParametrs((nil, nil, pageSize, page), for: urlString)

        loadData(for: urlStringWithParametrs, completion: completion)
    }
     
    private func addParametrs(_ params: NewParametrs, for urlString: String) -> String {
        
        var tempUrlString = urlString
        
        if let category = params.category {
            tempUrlString.append("&category=\(category)")
        }
        
        if let keyword = params.keyword {
            tempUrlString.append("&q=\(keyword)")
        }
        
        if let pageSize = params.pageSize {
            tempUrlString.append("&pageSize=\(pageSize)")
        }
        
        if let page = params.page {
            tempUrlString.append("&page=\(page)")
        }
        
        tempUrlString.append("&apiKey=\(APIConstant.APIkey)")
        
        return tempUrlString
    }
    
    private func loadData<T: Decodable>(for urlString: String, completion: @escaping (T?, Error?) -> ()) {
        let url = URL(string: urlString)!
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        request(urlRequest: urlRequest) { (result: Result<T, Error>) in
            
            switch result {
            case .success(let value):
                completion(value, nil)
                
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
