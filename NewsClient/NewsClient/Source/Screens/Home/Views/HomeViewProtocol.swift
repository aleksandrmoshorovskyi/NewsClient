//
//  HomeViewProtocol.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

protocol HomeViewProtocol {
    
    func setupViewControllers(data: [NewsViewController], and categories: [Category])
    func scrollToViewController(index: Int)
}
