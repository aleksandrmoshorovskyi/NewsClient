//
//  NewsViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class NewsViewController: BaseViewController {
    
    weak var delegate: NewsViewControllerDelegate?
    
    //var resultsTableController: UITableViewController!
    var currentCategory: Category? // = nil
    //let observer: NSObjectProtocol
    
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
        //model.loadDataFor(currentCategory)
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
    }
    
    private func setupUI() {
//        if let nc = navigationController {
//            nc.navigationBar.prefersLargeTitles = false
//            navigationItem.title = "NEWS"
//            
//            let nsAttributedString = [NSAttributedString.Key.foregroundColor: UIColor.red]
//            nc.navigationBar.titleTextAttributes = nsAttributedString
//            
//            navigationItem.titleView?.backgroundColor = .systemBackground
//            
//            //definesPresentationContext = true
//            
//            nc.navigationBar.backgroundColor = .systemBackground
//            
//            //for no change bg navigationBar color
//            nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
//            nc.navigationBar.shadowImage = UIImage()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model.updateFavorites()
    }
    
//    @objc func notificationReceiver() {
//        debugPrint("notificationReceiver")
//    }
    
    func notificationReceiver(_ notification: Notification) {
        
        if let object = notification.object as? ArticleDataModel {
            debugPrint("\(object.id)")
            model.updateFavorites()
        }
        
        if let object = notification.object as? Country {
            debugPrint("\(object.rawValue)")
            //model.loadDataFor(currentCategory)
            model.loadDataFor(category: currentCategory)
        }
    }
}
