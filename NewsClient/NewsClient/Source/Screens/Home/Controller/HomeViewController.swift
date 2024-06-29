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
        model.loadDataFor(self) //For(currentCategory)
    }
    
    private func setupInitialState() {
        let homeModel = HomeModel(delegate: self)
        model = homeModel
        
        currentCategory = nil
    }
    
    private func setupUI() {
        if let nc = navigationController {
            nc.navigationBar.prefersLargeTitles = false
            navigationItem.title = "NEWS".localized()
            
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
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        debugPrint("HomeViewController - viewWillAppear)")
//        delegate?.homeViewWillAppear()
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        debugPrint("HomeViewController - viewWillDisappear")
//        delegate?.homeViewWillDisappear()
//    }
}
