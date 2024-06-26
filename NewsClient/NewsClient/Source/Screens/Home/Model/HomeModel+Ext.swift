//
//  HomeModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

extension HomeModel: HomeModelProtocol {
    
    func loadDataFor(_ vc: NewsViewControllerDelegate) {
        
        var categoryVC: [NewsViewController] = []
        
        var categories: [Category] = Category.allCases
        
        //var dataSource: [(descriptionString: String, category: Category?)] = []
        
        //dataSource.append((descriptionString: "all", category: nil))
        
//        Category.allCases.forEach() {
//            dataSource.append((descriptionString: $0.rawValue, category: $0))
//        }
        
        //sorted
        
        if categories.count > 0 {
            categories.forEach() {//_ in
                
                let VC = NewsViewController()
                VC.currentCategory = $0
                VC.delegate = vc
                
                //VC.loadWeatherData(for: $0)
                
                categoryVC.append(VC)
            }
            
            //self.delegate?.dataDidLoad(with: categoryVC, for categories: categories)
            self.delegate?.dataDidLoad(with: categoryVC, for: categories)
            
        } else {
            //debugPrint("no data (cities)")
            //to add VC
            //self.delegate?.dataDidLoad(with: [])
        }
    }
}
