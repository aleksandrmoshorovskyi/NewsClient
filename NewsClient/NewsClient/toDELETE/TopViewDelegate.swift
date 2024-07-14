//
//  TopViewDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import Foundation

protocol TopViewDelegate: AnyObject {
    
    func addToFavoriteDidTap()
    func categoryDidChange(_ item: Category?)
}
