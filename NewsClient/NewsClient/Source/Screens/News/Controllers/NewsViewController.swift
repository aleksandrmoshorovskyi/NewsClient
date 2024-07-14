//
//  NewsViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class NewsViewController: BaseViewController {
    
    weak var delegate: NewsViewControllerDelegate?
    
    var currentCategory: Category?
    
    var model: NewsModelProtocol!
    var contentView: NewsViewProtocol!
    
    override func loadView() {
        
        let newsView = NewsView()
        newsView.delegate = self
        
        contentView = newsView
        view = newsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        setupUI()
        
        contentView.activityIndicatorStartAnimating()
        model.loadDataFor(category: currentCategory)
    }
    
    private func setupInitialState() {
        let newsModel = NewsModel(delegate: self)
        model = newsModel
        
        NotificationCenter.default.addObserver(
            forName: Constants.addedToFavoriteNotification,
            object: nil,
            queue: nil) { [self] (notification) in
                notificationReceiver(notification)
            }
        
        NotificationCenter.default.addObserver(
            forName: Constants.deletedFromFavoriteNotification,
            object: nil,
            queue: nil) { [self] (notification) in
                notificationReceiver(notification)
            }
        
        NotificationCenter.default.addObserver(
            forName: Notification.Name(DefaultManager.KEY_Country),
            object: nil,
            queue: nil) { [self] (notification) in
                notificationReceiver(notification)
            }
        
        NotificationCenter.default.addObserver(
            forName: Constants.updateAfterErrorNotification,
            object: nil,
            queue: nil) { [self] (notification) in
                notificationReceiver(notification)
            }
        
        contentView.setupPlaceholderData(data: model.getPlaceholderData())
        contentView.hidePlaceholder()
    }
    
    private func setupUI() {

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model.updateFavorites()
    }
    
    func notificationReceiver(_ notification: Notification) {
        
        if let _ = notification.object as? NewsModelProtocol {
            model.loadDataFor(category: currentCategory)
        }
        
        if let _ = notification.object as? ArticleDataModel {
            model.updateFavorites()
        }
        
        if let _ = notification.object as? Country {
            model.loadDataFor(category: currentCategory)
        }
    }
}
