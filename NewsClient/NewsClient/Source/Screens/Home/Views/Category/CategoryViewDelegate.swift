//
//  CategoryViewDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import Foundation

protocol CategoryViewDelegate: AnyObject {
    
    //func categoryDidTap(_ item: Category?)
    func categoryAtIndexDidTap(_ index: Int)
}
