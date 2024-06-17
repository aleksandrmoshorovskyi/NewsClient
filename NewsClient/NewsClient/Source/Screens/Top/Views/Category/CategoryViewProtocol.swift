//
//  CategoryViewProtocol.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import Foundation

protocol CategoryViewProtocol {
    
    func setupCategory(index: Int)
    
    func scrollToCategory(indexPath: IndexPath)
}
