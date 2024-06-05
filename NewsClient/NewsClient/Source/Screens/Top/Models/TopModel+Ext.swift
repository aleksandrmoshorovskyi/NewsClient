//
//  TopModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import Foundation

extension TopModel: TopModelProtocol {
    
    func loadData() {
        
        networkService.loadTopNews(for: Country.ukraine) { [weak self] newsData, error in

            if let err = error {
                debugPrint("\(err.localizedDescription)")
            }
            
            if let data = newsData  {
                
                if data.status == "error" {
                    debugPrint("\(String(describing: data.code))")
                }
                
                if data.status == "ok" {
                    //converte to local data model
                
                    self?.delegate?.dataDidLoad()
                }
            }
        }
    }
}
