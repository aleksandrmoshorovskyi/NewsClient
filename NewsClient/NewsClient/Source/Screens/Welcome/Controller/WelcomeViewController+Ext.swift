//
//  WelcomeViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import Foundation

//MARK: WelcomeModelDelegate
extension WelcomeViewController: WelcomeModelDelegate {
    
    func dataDidLoad(with data: [Country]) {
        contentView.setupData(data: data)
    }
}

//MARK: WelcomeViewDelegate
extension WelcomeViewController: WelcomeViewDelegate {
    
    func saveButtonDidTap() {
        
        if let navigationController = navigationController {
            navigationController.setViewControllers([MainTabBarController()], animated: true)
        }
    }
}
