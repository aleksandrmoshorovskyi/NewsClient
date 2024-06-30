//
//  WelcomeModelDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import Foundation

protocol WelcomeModelDelegate: AnyObject {
    
    func dataDidLoad(with data: [Country])
}
