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
        //model.loadDataFor(keyword: "Apple")
    }
    
    private func setupInitialState() {
        
        let searchModel = SearchModel(delegate: self)
        
        model = searchModel
    }
    
    private func setupUI() {
        if let nc = navigationController {
            nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = "search".localized().capitalized
            
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
            
            serchDataSource = DefaultManager.getSearchKeywords() ?? []
            
            // MARK: resultsTableController
            //let
            resultsTableController = UITableViewController()
            resultsTableController.tableView.delegate = self
            resultsTableController.tableView.dataSource = self
            
            let searchController = UISearchController(searchResultsController: resultsTableController)
            //searchController.data
            searchController.delegate = self
            searchController.searchResultsUpdater = self
            //searchController.searchBar.autocapitalizationType = .none
            searchController.searchBar.delegate = self // Monitor when the search button is tapped.
            searchController.hidesNavigationBarDuringPresentation = false
            searchController.showsSearchResultsController = true
            
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            //navigationItem.titleView?.isHidden = false
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
        //searchBar.searchTextField.text = ""
        //searchController.showsSearchResultsController
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //debugPrint("searchBarSearchButtonClicked")
        
        let searchString = searchBar.searchTextField.text!
        keywordStr = searchString
        //resultsTableController.tableView.reloadData()
        //searchController.searchResultsController?.reloadInputViews()
        
        //serchDataSource.append(searchString)
        serchDataSource.insert(searchString, at: 0)
        DefaultManager.setSearchKeywords(serchDataSource)
        //resultsTableController.tableView.reloadData()
        
        if serchDataSource.count > 10 {
            serchDataSource.removeLast()
        }
        
        model.loadDataFor(keyword: keywordStr)
        //navigationItem.searchController?.searchBar.searchTextField.text = ""
        navigationItem.searchController?.dismiss(animated: true)
        resultsTableController.tableView.reloadData()
        contentView.activityIndicatorStartAnimating()
    }
}

//MARK: UITableViewDelegate
extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let searchString = serchDataSource[indexPath.row]
        keywordStr = searchString
        
        model.loadDataFor(keyword: keywordStr)
        //navigationItem.searchController?.searchBar.searchTextField.text = ""
        navigationItem.searchController?.dismiss(animated: true)
        contentView.activityIndicatorStartAnimating()
    }
}

//MARK: UITableViewDataSource
extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        serchDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = UITableViewCell()
        
        cell.textLabel?.text = serchDataSource[indexPath.row]
         
        return cell
    }
}
