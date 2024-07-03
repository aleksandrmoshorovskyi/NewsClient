//
//  SettingsViewController+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation
import UIKit

//MARK: SettingsModelDelegate
extension SettingsViewController: SettingsModelDelegate {
    
    func dataDidLoad(with data: [SettingsDataModel]) {
        contentView.setupData(data: data)
    }
}

//MARK: SettingsViewDelegate
extension SettingsViewController: SettingsViewDelegate {
    
    func presentAlertWith(completion: @escaping () -> Void) {
        
        let alertController = UIAlertController(
            title: "language".localized().capitalized,
            message: "To change language you need to restart the application. Do you want to restart?".localized(),
            preferredStyle: .alert
        )
        
        let okAletalertAction = UIAlertAction(
            title: "OK",
            style: .destructive,
            handler: { _ in
                completion()
                //delay()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    //print("Async after 1 seconds")
                    exit(0)
                }
                //exit(0)
            })
        
        let cancelAletalertAction = UIAlertAction(
            title: "Cancel",
            style: .cancel) { (action) in
            // ...
        }
        
        alertController.addAction(okAletalertAction)
        alertController.addAction(cancelAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentAlert() {
        let alertController = UIAlertController(
            title: "language".localized().capitalized,
            message: "To change language you need to restart the application. Do you want to restart?".localized(),
            preferredStyle: .alert
        )

//        let okAction = UIAlertAction(title: "Yes".localized(), style: UIAlertAction.Style.default) {
//            UIAlertAction in
//            // Change update / refresh rootview controller here...
//            //let sceneDelegate = SceneDelegate()
//            //sceneDelegate.resetApp()
//        }
        
        let okAletalertAction = UIAlertAction(
            title: "OK",
            style: .destructive,
            handler: { _ in
                //NSLog("The \"OK\" alert occured.")
                //let sceneDelegate = SceneDelegate()
                //sceneDelegate.resetApp()
                exit(0)
            })
        
        let cancelAletalertAction = UIAlertAction(
            title: "Cancel",
            style: .cancel) { (action) in
            // ...
        }
        
        alertController.addAction(okAletalertAction)
        alertController.addAction(cancelAletalertAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}
