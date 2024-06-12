//
//  CoreDataService+News.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import Foundation
import CoreData

protocol CoreDataNews {
    func insertArticle(article: DMNewsModel.Article)
    func fetchAllArticles() -> [CDArticle]
    func deleteArticle(article: DMNewsModel.Article)
    func deleteAllArticles()
}

// MARK: - CoreDataNews
extension CoreDataService: CoreDataNews {
    
    func insertArticle(article: DMNewsModel.Article) {
        
        let articleEntityDescription = NSEntityDescription.entity(forEntityName: "CDArticle", in: context)!
        
        guard let articleCityEntity = NSManagedObject(entity: articleEntityDescription, insertInto: context) as? CDArticle
        else {
            assertionFailure()
            return
        }
        
        articleCityEntity.id = Int32(article.id)
        articleCityEntity.author = article.author
        articleCityEntity.title = article.title
        articleCityEntity.desc = article.description
        articleCityEntity.url = article.url
        articleCityEntity.urlToImage = article.urlToImage
        articleCityEntity.publishedAt = article.publishedAt
        articleCityEntity.content = article.content
        
        save(context: context)
    }
    
    func fetchAllArticles() -> [CDArticle] {
        
        let fetchRequest = CDArticle.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "publishedAt", ascending: true)]
        
        let fetchedResult = fetchDataFromEntity(CDArticle.self, fetchRequest: fetchRequest)
        
        return fetchedResult
    }
    
    func deleteArticle(article: DMNewsModel.Article) {
        
        let fetchRequest = CDArticle.fetchRequest()
        fetchRequest.predicate = NSPredicate(
            format: "id == %d", article.id
        )
        
        deleteRecords(CDArticle.self, fetchRequest: fetchRequest)
    }
    
    func deleteAllArticles() {
        
        deleteAll(CDArticle.self)
    }
}
