//
//  SearchViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import UIKit

class SearchViewController: BaseViewController {

    //weak var delegate: HomeViewControllerDelegate?
    var keywordStr: String!
    
    var model: SearchModelProtocol!
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
        //model.loadDataFor(keyword: "Apple")
    }
    
    private func setupInitialState() {
        
        let searchModel = SearchModel(delegate: self)
        
        model = searchModel
    }
    
    private func setupUI() {
        if let nc = navigationController {
            nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = "Search".localized()
            
            //let nsAttributedString = [NSAttributedString.Key.foregroundColor: UIColor.red]
            //nc.navigationBar.titleTextAttributes = nsAttributedString
            
            //navigationItem.titleView?.backgroundColor = .systemBackground
            
            //definesPresentationContext = true
            
            //nc.navigationBar.backgroundColor = .systemBackground
            
            //for no change bg navigationBar color
            //nc.navigationBar.setBackgroundImage(UIImage(), for: .default)
            //nc.navigationBar.shadowImage = UIImage()
            
            //nc.navigationItem.preferredSearchBarPlacement = .automatic
            //nc.navigationItem.hidesSearchBarWhenScrolling = false
            //definesPresentationContext = true
            
            let searchController = UISearchController(searchResultsController: UITableViewController())
            searchController.delegate = self
            searchController.searchResultsUpdater = self
            //searchController.searchBar.autocapitalizationType = .none
            searchController.searchBar.delegate = self // Monitor when the search button is tapped.
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //model.loadDataFor(keyword: "Apple")
    }
}

extension SearchViewController: UISearchControllerDelegate {
    
}

extension SearchViewController: UISearchResultsUpdating {
   
    func updateSearchResults(for searchController: UISearchController) {
        
//        let searchString = searchController.searchBar.text!
//        
//        //debugPrint("searchString - \(searchString)")
//        
//        if searchString.count >= 3 {
//            model.loadDataFor(keyword: searchString)
//        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searchBar.becomeFirstResponder()
        searchBar.searchTextField.text = ""
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //debugPrint("searchBarSearchButtonClicked")
        
        let searchString = searchBar.searchTextField.text!
        keywordStr = searchString
        
        model.loadDataFor(keyword: keywordStr)
        navigationItem.searchController?.searchBar.searchTextField.text = ""
        navigationItem.searchController?.dismiss(animated: true)
    }
}
