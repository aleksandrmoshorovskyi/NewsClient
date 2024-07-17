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
        let categories: [Category] = Category.allCases
        
        if categories.count > 0 {
            categories.forEach() {
                
                let VC = NewsViewController()
                VC.currentCategory = $0
                VC.delegate = vc
                categoryVC.append(VC)
            }
            
            self.delegate?.dataDidLoad(with: categoryVC, for: categories)
        }
    }
}
