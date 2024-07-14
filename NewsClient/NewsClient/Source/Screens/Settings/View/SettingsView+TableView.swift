//
//  SettingsView+TableView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import UIKit

extension SettingsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataSource[section].items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return dataSource[section].setting.title.uppercased()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = dataSource[indexPath.section].items[indexPath.row].title
        cell.accessoryType = dataSource[indexPath.section].items[indexPath.row].isOn ? .checkmark : .none
        cell.imageView?.image = dataSource[indexPath.section].items[indexPath.row].icon
        
        if indexPath.section == 1 {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
}

extension SettingsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
            
        case 0:
            if !dataSource[indexPath.section].items[indexPath.row].isOn {
                dataSource[indexPath.section].items.enumerated().forEach() {index, item in
                    dataSource[indexPath.section].items[index].isOn = false
                }
                dataSource[indexPath.section].items[indexPath.row].isOn = true
                tableView.reloadData()

                if let themeForDefault = dataSource[indexPath.section].items[indexPath.row].valueForDefault as? Theme {
                    
                    DefaultManager.setAppTheme(themeForDefault)
                }
                
            }
            
        case 1:
            delegate?.presentAlert(
                title: AppStrings.AlertController_language_title.localized.capitalized,
                message: AppStrings.AlertController_language_message.localized
            )
            
        case 2:
            if !dataSource[indexPath.section].items[indexPath.row].isOn {
                dataSource[indexPath.section].items.enumerated().forEach() {index, item in
                    dataSource[indexPath.section].items[index].isOn = false
                }
                dataSource[indexPath.section].items[indexPath.row].isOn = true
                tableView.reloadData()
                
                if let countryForDefault = dataSource[indexPath.section].items[indexPath.row].valueForDefault as? Country {
                    
                    DefaultManager.setAppCountry(countryForDefault)
                    
                    NotificationCenter.default.post(
                        name: Notification.Name(DefaultManager.KEY_Country),
                        object: countryForDefault,
                        userInfo: nil
                    )
                }
            }
            
        default: break
            //
        }
        
    }
}
