//
//  CategoryViewDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import Foundation

protocol CategoryViewDelegate: AnyObject {
    
    func categoryAtIndexDidTap(_ index: Int)
}
