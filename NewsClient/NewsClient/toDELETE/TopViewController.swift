////
////  TopViewController.swift
////  NewsClient
////
////  Created by Aleksandr Moroshovskyi on 05.06.2024.
////
//
//import UIKit
//
//class TopViewController: BaseViewController {
//    
//    //weak var delegate: TopViewControllerDelegate?
//    
//    var resultsTableController: UITableViewController!
//    var currentCategory: Category? // = nil
//    
//    var model: TopModelProtocol!
//    var contentView: TopViewProtocol!
//    
//    override func loadView() {
//        
//        let topView = TopView()
//        topView.delegate = self
//        
//        contentView = topView
//        view = topView
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupInitialState()
//        setupUI()
//        model.loadDataFor(currentCategory)
//    }
//    
//    private func setupInitialState() {
//        let topModel = TopModel(delegate: self)
//        model = topModel
//        
//        currentCategory = nil
//    }
//    
//    private func setupUI() {
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
//        
//        /*
//        if let nc = navigationController {
//            //nc.navigationBar.prefersLargeTitles = true
////            nc.navigationBar.tintColor = .white
//            
////            let nsAttributedString = [NSAttributedString.Key.foregroundColor: UIColor.white]
////            nc.navigationBar.titleTextAttributes = nsAttributedString
////            nc.navigationBar.largeTitleTextAttributes = nsAttributedString
//            
// //           navigationItem.hidesBackButton = true
//            navigationItem.title = "News"
//            //navigationItem.rightBarButtonItem = settingsBarButton
//            
//            // MARK: resultsTableController
//            resultsTableController = UITableViewController()
//            //resultsTableController.tableView.delegate = self
//            //resultsTableController.tableView.dataSource = self
//            
//            let searchController = UISearchController(searchResultsController: resultsTableController)
//            //searchController.delegate = self
//            //searchController.searchResultsUpdater = self
//            //searchController.searchBar.autocapitalizationType = .none
//            //searchController.searchBar.delegate = self // Monitor when the search button is tapped.
//            
//            navigationItem.searchController = searchController
//            //navigationItem.hidesSearchBarWhenScrolling = false
//
//            definesPresentationContext = true
//        }
//         */
//    }
//}
