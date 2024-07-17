//
//  WelcomeView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import Foundation

// MARK: WelcomeViewProtocol
extension WelcomeView: WelcomeViewProtocol {
    
    func setupData(data: [Country]) {
        
        dataSource = data
        
        collectionView.reloadData()
    }
}
