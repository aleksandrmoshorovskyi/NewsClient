//
//  NetworkService+News.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

typealias NewsCompletion = ((DMNewsModel?, Error?) -> ())

protocol NetworkServiceNews {

    func loadTopNews(for country: Country, completion: @escaping NewsCompletion)
}

extension NetworkService: NetworkServiceProtocol {
    
    func loadTopNews(for country: Country, completion: @escaping NewsCompletion) {
        let urlString = APIConstant.topNewsUrl() + "?" + "country=\(country.rawValue)" + "&" + "apiKey=\(APIConstant.APIkey)"

        loadData(for: urlString, completion: completion)
    }
     
    //common methods
    /*
    private func addParametrs(_ params: WeatherParametrs, for urlString: String) -> String {
        
        var tempUrlString = urlString
        
        if let units = params.units {
            tempUrlString += "&units=\(units)"
        }
        
        if let lang = params.lang {
            tempUrlString += "&lang=\(lang)"
        }
        
        return tempUrlString
    }
     */
    
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
