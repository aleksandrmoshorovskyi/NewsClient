//
//  NewsViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

//extension NewsViewController: HomeViewControllerDelegate {
//   
//    func homeViewWillAppear() {
//        debugPrint("Here must be Update")
//        //debugPrint("\(String(describing: self.currentCategory))")
//    }
//    
//    func homeViewWillDisappear() {
//        debugPrint("Here must be SaveIfNeeded")
//    }
//}

//NewsModelDelegate
extension NewsViewController: NewsModelDelegate {
   
    func presentAlertWith(_ title: String, _ message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAletalertAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                //NSLog("The \"OK\" alert occured.")
                //let sceneDelegate = SceneDelegate()
                //sceneDelegate.resetApp()
                //exit(0)
            })
        
//        let cancelAletalertAction = UIAlertAction(
//            title: "Cancel",
//            style: .cancel) { (action) in
//            // ...
//        }
        
        alertController.addAction(okAletalertAction)
        //alertController.addAction(cancelAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func dataDidLoad(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
    
    func dataDidUpdated(with data: [ArticleDataModel]) {
        contentView.setupNews(data: data)
    }
}

//NewsViewDelegate
extension NewsViewController: NewsViewDelegate {
    
//    func presentAlert() {
//        //
//    }
    
    func refreshData() {
        if let currentCategory = currentCategory {
            model.loadDataFor(category: currentCategory)
        } else {
            contentView.stopRefreshing()
        }
    }
    
    func loadNextPageIfExists() {
        if let currentCategory = currentCategory {
            model.prefetchDataFor(category: currentCategory)
        }
    }
    
    func deleteFromFavorite(article: ArticleDataModel) {
        model.deleteFavorite(article: article)
    }
    
    func addToFavorite(article: ArticleDataModel) {
        model.addFavorite(article: article)
    }
    
    func newsRowDidTapAt(_ article: ArticleDataModel) {
        
        delegate?.newsDidTap(article)
    }

    func categoryDidChange(_ index: Int) {
        //code
    }
    
    func categoryDidChange(_ item: Category?) {
        
        if currentCategory != item {
            //model.loadDataFor(item)
            model.loadDataFor(category: item)
        }
        
        currentCategory = item
    }
    
//    func addToFavoriteDidTap() {
//        //code
//    }
}
