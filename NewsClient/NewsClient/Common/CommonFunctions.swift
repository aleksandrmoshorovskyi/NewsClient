//
//  CommonFunctions.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 14.07.2024.
//

import UIKit

class CommonFunctions {
    
    static func openInSafari(article: ArticleDataModel) {
        
        if let urlToArticle = article.url {
            if let url = URL(string: urlToArticle) {
                UIApplication.shared.open(url) {_ in
                    //code
                }
            }
        }
    }
}
