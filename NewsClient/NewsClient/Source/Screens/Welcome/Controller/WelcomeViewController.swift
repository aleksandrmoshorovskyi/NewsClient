//
//  WelcomeViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var model: WelcomeModelProtocol!
    var contentView: WelcomeViewProtocol!
    
    override func loadView() {
        
        let welcomeView = WelcomeView()
        welcomeView.delegate = self
        
        contentView = welcomeView
        view = welcomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        setupUI()
        model.loadData()
    }
    
    private func setupInitialState() {
        let welcomeModel = WelcomeModel(delegate: self)
        model = welcomeModel
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.Welcome_SystemBackground
    }
}
