//
//  FavoriteViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import UIKit

class FavoriteViewController: BaseViewController {
    
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
        
        contentView.setupPlaceholderData(data: model.getPlaceholderData())
    }
    
    private func setupUI() {
        
        if let nc = navigationController {

            navigationItem.title = AppStrings.FavoriteViewController_title.localized.capitalized
            
            navigationItem.titleView?.backgroundColor = Constants.FavoriteViewController_BackgroundColor
            
            nc.navigationBar.backgroundColor = Constants.FavoriteViewController_BackgroundColor
            
            //for no change bg navigationBar color
            nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nc.navigationBar.shadowImage = UIImage()
            
            let searchController = UISearchController(searchResultsController: UITableViewController())
            //searchController.delegate = self
            searchController.searchResultsUpdater = self

            searchController.hidesNavigationBarDuringPresentation = false
            searchController.showsSearchResultsController = false
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.titleView?.isHidden = false
            
            let placeholderColor = NSAttributedString(
                string: AppStrings.FavoriteViewController_searchBar_placeholder.localized
            )
            
            navigationItem.searchController?.searchBar.searchTextField.attributedPlaceholder = placeholderColor
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.searchController?.searchBar.searchTextField.text = ""
        contentView.activityIndicatorStartAnimating()
        model.loadData()
    }
}

//extension FavoriteViewController: UISearchControllerDelegate {
//    
//}


