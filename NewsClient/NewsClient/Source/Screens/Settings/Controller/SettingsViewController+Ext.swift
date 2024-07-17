//
//  SettingsViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import UIKit

// MARK: SettingsModelDelegate
extension SettingsViewController: SettingsModelDelegate {
    
    func dataDidLoad(with data: [SettingsDataModel]) {
        contentView.setupData(data: data)
    }
}

// MARK: SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
    
    func presentAlert(title: String, message: String) {
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAletalertAction = UIAlertAction(
            title: AppStrings.AlertController_okAletalertAction.localized,
            style: .destructive,
            handler: {_ in
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            })
        
        let cancelAletalertAction = UIAlertAction(
            title: AppStrings.AlertController_cancelAletalertAction.localized,
            style: .cancel) {_ in }
        
        alertController.addAction(okAletalertAction)
        alertController.addAction(cancelAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
