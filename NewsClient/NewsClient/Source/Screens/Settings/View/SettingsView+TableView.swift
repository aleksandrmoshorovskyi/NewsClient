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
//                UserDefaults.standard.setValue(
//                    dataSource[indexPath.section].items[indexPath.row].valueForDefault as? String,
//                    forKey: "theme"
//                )
                if let themeForDefault = dataSource[indexPath.section].items[indexPath.row].valueForDefault as? Theme {
                    
                    DefaultManager.setAppTheme(themeForDefault)
                }
                
            }
            
        case 1:
            if !dataSource[indexPath.section].items[indexPath.row].isOn {
//                dataSource[indexPath.section].items.enumerated().forEach() {index, item in
//                    dataSource[indexPath.section].items[index].isOn = false
//                }
//                dataSource[indexPath.section].items[indexPath.row].isOn = true
//                tableView.reloadData()
//                UserDefaults.standard.setValue(
//                    dataSource[indexPath.section].items[indexPath.row].title,
//                    forKey: "theme"
//                )
                
                if indexPath.row <= 1 {
                    //DefaultManager.setAppLanguage(ver: indexPath.row)
                    //alertBeforeChangeLanguage()
                    //delegate?.presentAlert()
                    delegate?.presentAlertWith {
                        self.dataSource[indexPath.section].items.enumerated().forEach() {index, item in
                            self.dataSource[indexPath.section].items[index].isOn = false
                        }
                        self.dataSource[indexPath.section].items[indexPath.row].isOn = true
                        self.tableView.reloadData()
                        DefaultManager.setAppLanguage(ver: indexPath.row)
                    }
                } else {
                    //DefaultManager.removeAppLanguage()
                    //delegate?.presentAlert()
                    delegate?.presentAlertWith {
                        self.dataSource[indexPath.section].items.enumerated().forEach() {index, item in
                            self.dataSource[indexPath.section].items[index].isOn = false
                        }
                        self.dataSource[indexPath.section].items[indexPath.row].isOn = true
                        self.tableView.reloadData()
                        DefaultManager.removeAppLanguage()
                    }
                }
            }
            
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
