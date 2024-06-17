//
//  HomeModelDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

protocol HomeModelDelegate: AnyObject {
    
    func dataDidLoad(with viewControllers: [NewsViewController])
}
