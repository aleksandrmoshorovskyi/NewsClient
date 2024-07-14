//
//  NewsDetailsViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import UIKit

class NewsDetailsViewController: BaseViewController {
    
    weak var delegate: NewsDetailsViewControllerDelegate?
    
    var dataModel: ArticleDataModel!
    
    //var model: NewsDetailsModelProtocol!
    var contentView: NewsDetailsViewProtocol!
    
    var shareBarButtonItem: UIBarButtonItem!
    var openInSafariBarButtonItem: UIBarButtonItem!
    var addToFavoriteBarButtonItem: UIBarButtonItem!
    
    @objc func addToFavoriteBarButtonDidTap() {
        debugPrint("addToFavoriteBarButtonDidTap")
        
        if dataModel.isFavorite {
            //delete from favorite
            dataModel.isFavorite = false
            
            //delegate?.deleteFromFavorite(article: dataModel)
            if let deleteFromFavoriteActionCompletion = dataModel.deleteFromFavoriteActionCompletion {
                deleteFromFavoriteActionCompletion(dataModel)
            }
            
            addToFavoriteBarButtonItem.image = UIImage(systemName: "bookmark")
        } else {
            //add to favorite
            dataModel.isFavorite = true
            
            //delegate?.addToFavorite(article: dataModel)
            if let addToFavoriteActionCompletion = dataModel.addToFavoriteActionCompletion {
                addToFavoriteActionCompletion(dataModel)
            }
            
            addToFavoriteBarButtonItem.image = UIImage(systemName: "bookmark.fill")
        }
    }
    
    @objc func openInSafariBarButtonDidTap() {
        CommonFunctions.openInSafari(article: dataModel)
    }
    
    @objc func shareBarButtonDidTap() {
        baseShareAction(article: dataModel)
    }
    
    override func loadView() {
        
        let newsDetailsView = NewsDetailsView()
        newsDetailsView.delegate = self
        
        contentView = newsDetailsView
        view = newsDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        setupUI()
    }
    
    private func setupInitialState() {

        contentView.setupNews(data: dataModel)
        
        NotificationCenter.default.addObserver(
            forName: Constants.deletedFromFavoriteNotification,
            object: nil,
            queue: nil) { [self] (notification) in
                //print(notification.userInfo?["message"] ?? "")
                notificationReceiver(notification)
            }
        
        NotificationCenter.default.addObserver(
            forName: Constants.addedToFavoriteNotification,
            object: nil,
            queue: nil) { [self] (notification) in
                notificationReceiver(notification)
            }
    }
    
    private func notificationReceiver(_ notification: Notification) {
        
        if let object = notification.object as? ArticleDataModel {
            
            dataModel.isFavorite = object.isFavorite
            
            setupUI()
        }
    }
    
    private func setupUI() {
        
        if let _ = navigationController {
            
            addToFavoriteBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: dataModel.isFavorite ? "bookmark.fill" : "bookmark"),
                style: .plain,
                target: self,
                action: #selector(addToFavoriteBarButtonDidTap)
            )
            
            openInSafariBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "safari"),
                style: .plain,
                target: self,
                action: #selector(openInSafariBarButtonDidTap)
            )
            
            shareBarButtonItem = UIBarButtonItem(
                image: UIImage(systemName: "square.and.arrow.up"),
                style: .plain,
                target: self,
                action: #selector(shareBarButtonDidTap)
            )
            
            navigationItem.rightBarButtonItems = [
                addToFavoriteBarButtonItem,
                openInSafariBarButtonItem,
                shareBarButtonItem
            ]
        }
    }
}

