//
//  HomeModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

extension HomeModel: HomeModelProtocol {
    
    func loadData() {
        
        var categoryVC: [NewsViewController] = []
        
        var dataSource: [(descriptionString: String, category: Category?)] = []
        
        dataSource.append((descriptionString: "all", category: nil))
        
        Category.allCases.forEach() {
            dataSource.append((descriptionString: $0.rawValue, category: $0))
        }
        
        //sorted
        
        if dataSource.count > 0 {
            dataSource.forEach() {//_ in 
                
                let VC = NewsViewController()
                VC.currentCategory = $0.category
                
                //VC.loadWeatherData(for: $0)
                
                categoryVC.append(VC)
            }
            
            self.delegate?.dataDidLoad(with: categoryVC)
            
        } else {
            //debugPrint("no data (cities)")
            //to add VC
            //self.delegate?.dataDidLoad(with: [])
        }
    }
}
