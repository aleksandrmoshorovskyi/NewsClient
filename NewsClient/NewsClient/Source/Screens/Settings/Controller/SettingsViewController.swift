//
//  SettingsViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var model: SettingsModelProtocol!
    var contentView: SettingsViewProtocol!
    
    override func loadView() {
        
        let settingsView = SettingsView()
        settingsView.delegate = self
        
        contentView = settingsView
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        setupUI()
        model.loadData()
    }
    
    private func setupInitialState() {
        let settingsModel = SettingsModel(delegate: self)
        model = settingsModel
    }
    
    private func setupUI() {
        view.backgroundColor = Constants.common_SystemBackground
        title = AppStrings.SettingsViewController_title.localized.capitalized
    }
}
