//
//  NewsDetailsViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import UIKit

class NewsDetailsViewController: BaseViewController {
    
    weak var delegate: NewsDetailsViewControllerDelegate?
    
    var dataModel: ArticleDataModel!
    
    //var model: NewsDetailsModelProtocol!
    var contentView: NewsDetailsViewProtocol!
    
    override func loadView() {
        
        let newsDetailsView = NewsDetailsView()
        newsDetailsView.delegate = self
        
        contentView = newsDetailsView
        view = newsDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        setupUI()
    }
    
    private func setupInitialState() {
        //let newsModel = NewsModel(delegate: self)
        //model = newsModel
        
        //currentCategory = nil
        
        contentView.setupNews(data: dataModel)
    }
    
    private func setupUI() {

    }
}

