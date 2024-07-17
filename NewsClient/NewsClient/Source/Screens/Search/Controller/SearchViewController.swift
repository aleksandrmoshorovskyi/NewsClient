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

            searchController.delegate = self

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

extension SearchViewController: UISearchControllerDelegate {
    
}

//extension SearchViewController: UISearchResultsUpdating {
//   
//    func updateSearchResults(for searchController: UISearchController) {
//        
////        let searchString = searchController.searchBar.text!
////        
////        //debugPrint("searchString - \(searchString)")
////        
////        if searchString.count >= 3 {
////            model.loadDataFor(keyword: searchString)
////        }
//    }
//}

extension SearchViewController: UISearchBarDelegate {
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        //searchBar.searchTextField.text = ""
//        //searchController.showsSearchResultsController
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //debugPrint("searchBarSearchButtonClicked")
        
        let searchString = searchBar.searchTextField.text!.trimmingCharacters(in: .whitespaces)
        keywordStr = searchString
        //resultsTableController.tableView.reloadData()
        //searchController.searchResultsController?.reloadInputViews()
        
        //serchDataSource.append(searchString)

        //resultsTableController.tableView.reloadData()
        
        if !keywordStr.isEmpty {
            if serchDataSource.contains(searchString) {
                if let index = serchDataSource.firstIndex(of: searchString) {
                    serchDataSource.remove(at: index)
                }
            }
            
            serchDataSource.insert(searchString, at: 0)
            
            DefaultManager.setSearchKeywords(serchDataSource)
        }
        
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let viewForHeaderInSection = SearchInfoView()
        
        viewForHeaderInSection.delegate = self
        
        if serchDataSource.count == 0 {
            //viewForHeaderInSection.setupTitle("No recent searches".localized())
            viewForHeaderInSection.setupTitle(
                AppStrings.SearchViewController_HeaderView_No_recent_searches.localized
            )
            viewForHeaderInSection.showClearButton(false)
        } else {
            //viewForHeaderInSection.setupTitle("Recent searches".localized())
            viewForHeaderInSection.setupTitle(
                AppStrings.SearchViewController_HeaderView_Recent_searches.localized
            )
            viewForHeaderInSection.showClearButton(true)
        }
        
        return viewForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return Constants.SearchInfoView_Height
    }
    
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
