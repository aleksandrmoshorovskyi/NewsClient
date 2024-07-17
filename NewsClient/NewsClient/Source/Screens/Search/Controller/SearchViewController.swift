//
//  SearchViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 28.06.2024.
//

import UIKit

class SearchViewController: BaseViewController {

    var keywordStr: String!
    var serchDataSource: [String] = []
    
    var resultsTableController: UITableViewController!
    
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
    }
    
    private func setupInitialState() {
        
        let searchModel = SearchModel(delegate: self)
        model = searchModel
        
        contentView.setupPlaceholderData(data: model.getPlaceholderData())
    }
    
    private func setupUI() {
        
        if let nc = navigationController {
            
            nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = AppStrings.SearchViewController_title.localized.capitalized
            
            serchDataSource = DefaultManager.getSearchKeywords() ?? []
            
            // MARK: resultsTableController
            resultsTableController = UITableViewController()
            resultsTableController.tableView.delegate = self
            resultsTableController.tableView.dataSource = self
            
            let searchController = UISearchController(searchResultsController: resultsTableController)

            //searchController.delegate = self

            searchController.searchBar.delegate = self // Monitor when the search button is tapped.
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.showsSearchResultsController = true
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            
            let placeholderColor = NSAttributedString(
                string: AppStrings.SearchViewController_searchBar_placeholder.localized
            )
            navigationItem.searchController?.searchBar.searchTextField.attributedPlaceholder = placeholderColor
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if keywordStr == nil {
            model.loadDataFor(keyword: "")
            navigationItem.prompt = AppStrings.SearchViewController_navigationItem_prompt_empty.localized
        }
    }
}

//extension SearchViewController: UISearchControllerDelegate {
//    
//}

