//
//  FavoriteViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import UIKit

class FavoriteViewController: BaseViewController {
    
    //weak var delegate: HomeViewControllerDelegate?
    
    //let myNotification = Notification.Name("MyNotification")
    
    var model: FavoriteModelProtocol!
    var contentView: NewsViewProtocol!
    
    override func loadView() {
        
        let favoriteView = NewsView()
        favoriteView.delegate = self
        
        contentView = favoriteView
        view = favoriteView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        setupUI()
        model.loadData()
    }
    
    private func setupInitialState() {
        let favoriteModel = FavoriteModel(delegate: self)
        model = favoriteModel
        
        //currentCategory = nil
    }
    
    private func setupUI() {
        if let nc = navigationController {
            nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = "Favorite"
            
            let nsAttributedString = [NSAttributedString.Key.foregroundColor: UIColor.red]
            nc.navigationBar.titleTextAttributes = nsAttributedString
            
            navigationItem.titleView?.backgroundColor = .systemBackground
            
            //definesPresentationContext = true
            
            nc.navigationBar.backgroundColor = .systemBackground
            
            //for no change bg navigationBar color
            nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nc.navigationBar.shadowImage = UIImage()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model.loadData()
    }
}
