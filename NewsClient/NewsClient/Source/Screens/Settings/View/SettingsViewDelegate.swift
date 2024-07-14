//
//  SettingsViewDelegate.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import Foundation

protocol SettingsViewDelegate: AnyObject {
    func presentAlert()
    func presentAlertWith(completion: @escaping () -> Void)
}
