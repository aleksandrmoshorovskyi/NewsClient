//
//  HomeViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class HomeViewController: BaseViewController {
    
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
        model.loadDataFor(self)
    }
    
    private func setupInitialState() {
        let homeModel = HomeModel(delegate: self)
        model = homeModel
        
        currentCategory = nil
    }
    
    private func setupUI() {
        //title = AppStrings.HomeViewController_title.localized.capitalized
        
        if let nc = navigationController {
            
            nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = AppStrings.HomeViewController_navigationItem_title.localized.uppercased()
            
            let nsAttributedString = [
                NSAttributedString.Key.foregroundColor: UIColor.red,
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: Constants.HomeViewController_Title)
            ]
            nc.navigationBar.titleTextAttributes = nsAttributedString
            
            navigationItem.titleView?.backgroundColor = Constants.HomeViewController_BackgroundColor
            nc.navigationBar.backgroundColor = Constants.HomeViewController_BackgroundColor
            
            //for no change bg navigationBar color
            nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nc.navigationBar.shadowImage = UIImage()
        }
    }
}
