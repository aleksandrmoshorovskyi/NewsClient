//
//  HomeViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //weak var delegate: HomeViewControllerDelegate?
    
    var resultsTableController: UITableViewController!
    var currentCategory: Category? // = nil
    
    var model: HomeModelProtocol!
    var contentView: HomeViewProtocol!
    
    override func loadView() {
        
        let homeView = HomeView()
        homeView.delegate = self
        
        contentView = homeView
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        setupUI()
        model.loadData() //For(currentCategory)
    }
    
    private func setupInitialState() {
        let homeModel = HomeModel(delegate: self)
        model = homeModel
        
        currentCategory = nil
    }
    
    private func setupUI() {
        if let nc = navigationController {
            nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = "NEWS"
            
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
}
