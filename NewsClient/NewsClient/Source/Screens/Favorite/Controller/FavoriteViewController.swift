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
            //nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = "Favorites".localized()
            debugPrint("\(String(describing: nc.navigationBar.isHidden))")
            
            //nc.navigationBar.hidesNavigationBarDuringPresentation = false
            //let navBar = nc.navigationBar
            //navBar.topItem?.searchBarPlacement = .stacked
            
            //nc.navigationBar.isHidden = true
            //navigationItem.titleView = UIView()
            //navigationItem.style = .editor
            
            //let nsAttributedString = [NSAttributedString.Key.foregroundColor: UIColor.red]
            //nc.navigationBar.titleTextAttributes = nsAttributedString
            
            navigationItem.titleView?.backgroundColor = .systemBackground
            
            //definesPresentationContext = true
            
            nc.navigationBar.backgroundColor = .systemBackground
            
            //for no change bg navigationBar color
            nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
            nc.navigationBar.shadowImage = UIImage()
            
            let searchController = UISearchController(searchResultsController: UITableViewController())
            searchController.delegate = self
            searchController.searchResultsUpdater = self
            //searchController.searchBar.autocapitalizationType = .none
            searchController.searchBar.delegate = self // Monitor when the search button is tapped.
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.showsSearchResultsController = false
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationItem.titleView?.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model.loadData()
    }
}

extension FavoriteViewController: UISearchControllerDelegate {
    
}

extension FavoriteViewController: UISearchResultsUpdating {
   
    func updateSearchResults(for searchController: UISearchController) {
        
        //let searchString = searchController.searchBar.text!
        
        //if searchString.count >= 1 {
            model.filterDataWith(predicate: searchController.searchBar.text)
        //}
    }
}

extension FavoriteViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searchBar.searchTextField.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //debugPrint("searchBarSearchButtonClicked")
        
        //let searchString = searchBar.searchTextField.text!
        //keywordStr = searchString
        
        //model.loadDataFor(keyword: keywordStr)
        //navigationItem.searchController?.searchBar.searchTextField.text = ""
        //navigationItem.searchController?.dismiss(animated: true)
    }
}
