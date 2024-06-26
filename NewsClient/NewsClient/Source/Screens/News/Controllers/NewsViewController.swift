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
        model.loadDataFor(currentCategory)
    }
    
    private func setupInitialState() {
        let newsModel = NewsModel(delegate: self)
        model = newsModel
        
        //currentCategory = nil
//      
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(notificationReceiver),
//            name: Constants.deleteFromFavoriteNotification,
//            object: nil)
        NotificationCenter.default.addObserver(
            forName: Constants.deleteFromFavoriteNotification,
            object: nil,
            queue: nil) { [self] (notification) in
                //print(notification.userInfo?["message"] ?? "")
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
            debugPrint("\(object.idStr ?? "")")
            model.updateFavorites()
        }
    }
}
