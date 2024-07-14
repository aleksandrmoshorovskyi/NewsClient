//
//  NewsViewControllerDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import Foundation

protocol NewsViewControllerDelegate: AnyObject {

    func newsDidTap(_ article: ArticleDataModel)
}
