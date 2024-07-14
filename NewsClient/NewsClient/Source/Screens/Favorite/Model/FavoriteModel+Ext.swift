//
//  FavoriteModel+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import Foundation
import UIKit

extension FavoriteModel: FavoriteModelProtocol {
    
    func getPlaceholderData() -> PlaceholderDataModel {
//        return PlaceholderDataModel(
//            imageSystemName: "bookmark",
//            titleText: NSAttributedString("Hello"),
//            descriptionText: NSAttributedString("description")
//        )
        return PlaceholderDataModel(
            imageSystemName: "bookmark",
            titleText: getTextForTitlePlaceholderLabel(),
            descriptionText: getTextForDescriptionPlaceholderLabel()
        )
    }
    
    func loadData() {
    
        //var articles: [ArticleDataModel] = []
        
        let storedArticles = storageService.fetchAllArticles()
        
        articles = storedArticles.compactMap() {
            ArticleDataModel(
                isFavorite: true,
                id: $0.id ?? "",
                author: $0.author,
                title: $0.title,
                descriptionString: $0.description,
                url: $0.url,
                urlToImage: $0.urlToImage,
                publishedAt: $0.publishedAt,
                content: $0.content)//,
                //addToFavoriteActionCompletion: nil,
                //deleteFromFavoriteActionCompletion: deleteFavorite)
        }
        
        self.delegate?.dataDidLoad(with: articles)
    }
    
    func filterDataWith(predicate: String?) {
        
        if let predicate = predicate {
            
            if predicate.count >= 1 {
                let filteredData = articles.filter() { $0.title?.contains(predicate) ?? false }
                self.delegate?.dataDidLoad(with: filteredData)
            } else {
                self.delegate?.dataDidLoad(with: articles)
            }
        }
    }
    
    func deleteFavorite(article: ArticleDataModel) {
        
        self.storageService.deleteArticle(article: article)
    }
    
    func addToFavorite(article: ArticleDataModel) {
        
        self.storageService.insertArticle(article: article)
    }
    
    private func getTextForTitlePlaceholderLabel() -> NSAttributedString {
        
        //let attributedText = NSAttributedString(string: "Find your saved \n articles here".localized())
        let attributedText = NSAttributedString(
            string: AppStrings.FavoriteViewController_Placeholder_titleText.localized
        )
        
        return attributedText
    }
    
    private func getTextForDescriptionPlaceholderLabel() -> NSAttributedString {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "bookmark")?.withTintColor(.systemBlue)
        //imageAttachment.image?.withTintColor(.systemBlue)
        //imageAttachment.image?.withTintColor(.systemBlue)
        
        let attributedText = NSMutableAttributedString()
        //attributedText.append(NSAttributedString(string: "When reading an article, tap the ".localized()))
        attributedText.append(NSAttributedString(
            string: AppStrings.FavoriteViewController_Placeholder_descriptionText.localized
        ))
        attributedText.append(NSAttributedString(attachment: imageAttachment))
        attributedText.append(NSAttributedString(string: "\n"))
        //attributedText.append(NSAttributedString(string: "icon to save it. ".localized()))
        attributedText.append(NSAttributedString(
            string: AppStrings.FavoriteViewController_Placeholder_descriptionTextOne.localized
        ))
        //attributedText.append(NSAttributedString(string: "You'll be able to come back here to read it later".localized()))
        attributedText.append(NSAttributedString(
            string: AppStrings.FavoriteViewController_Placeholder_descriptionTextTwo.localized
        ))
        
        return attributedText
    }
}
