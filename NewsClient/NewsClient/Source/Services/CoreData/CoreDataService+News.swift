//
//  CoreDataService+News.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import Foundation
import CoreData

protocol CoreDataNews {
    func insertArticle(article: ArticleDataModel)
    func fetchAllArticles() -> [CDArticle]
    func deleteArticle(article: ArticleDataModel)
    func deleteAllArticles()
}

// MARK: - CoreDataNews
extension CoreDataService: CoreDataNews {
    
    func insertArticle(article: ArticleDataModel) {
        
        let articleEntityDescription = NSEntityDescription.entity(forEntityName: "CDArticle", in: context)!
        
        guard let articleCityEntity = NSManagedObject(entity: articleEntityDescription, insertInto: context) as? CDArticle
        else {
            assertionFailure()
            return
        }
        
        articleCityEntity.id = article.id
        articleCityEntity.author = article.author
        articleCityEntity.title = article.title
        articleCityEntity.desc = article.descriptionString
        articleCityEntity.url = article.url
        articleCityEntity.urlToImage = article.urlToImage
        articleCityEntity.publishedAt = article.publishedAt
        articleCityEntity.content = article.content
        
        save(context: context)
    }
    
    func fetchAllArticles() -> [CDArticle] {
        
        let fetchRequest = CDArticle.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "publishedAt", ascending: false)]
        
        let fetchedResult = fetchDataFromEntity(CDArticle.self, fetchRequest: fetchRequest)
        
        return fetchedResult
    }
    
    func deleteArticle(article: ArticleDataModel) {
        
        let fetchRequest = CDArticle.fetchRequest()
        fetchRequest.predicate = NSPredicate(
            format: "id == %@", article.id
        )
        
        deleteRecords(CDArticle.self, fetchRequest: fetchRequest)
    }
    
    func deleteAllArticles() {
        
        deleteAll(CDArticle.self)
    }
}
