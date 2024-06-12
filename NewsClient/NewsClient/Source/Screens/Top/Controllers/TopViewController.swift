//
//  TopViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import UIKit

class TopViewController: BaseViewController {
    
    //weak var delegate: TopViewControllerDelegate?
    
    var model: TopModelProtocol!
    
    //var contentView: TopViewProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        model.loadData()
    }
    
    private func setupInitialState() {
        let topModel = TopModel(delegate: self)
        model = topModel
    }
}
