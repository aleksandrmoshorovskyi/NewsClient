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
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateLocalizedUI),
            name: NSLocale.currentLocaleDidChangeNotification,
            object: nil
        )
    }
    
    private func setupInitialState() {
        let settingsModel = SettingsModel(delegate: self)
        model = settingsModel
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        title = "settings".localized().capitalized
        
        //UserDefaults.standard.setValue(Theme.dark.rawValue, forKey: "theme")
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
//        title = "settings".localized().capitalized
//    }
    
    @objc private func updateLocalizedUI() {
        title = "settings".localized().capitalized
    }
}
