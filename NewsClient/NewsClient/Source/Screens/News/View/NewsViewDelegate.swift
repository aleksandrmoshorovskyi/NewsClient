//
//  NewsViewDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

protocol NewsViewDelegate: AnyObject {
    
    func addToFavoriteDidTap()
    //func categoryDidChange(_ item: Category?)
    func categoryDidChange(_ index: Int)
}
