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
        
        return dataSource[section].setting.title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell()
        
        switch indexPath.section {
            
        case 0:
            cell.textLabel?.text = dataSource[indexPath.section].items[indexPath.row].title
            cell.accessoryType = dataSource[indexPath.section].items[indexPath.row].isOn ? .checkmark : .none
            
        case 1: 
            cell.textLabel?.text = dataSource[indexPath.section].items[indexPath.row].title
            cell.accessoryType = dataSource[indexPath.section].items[indexPath.row].isOn ? .checkmark : .none
            
        default: break
            //
        }
        
        //cell.textLabel?.text = dataSource[indexPath.section].items[indexPath.row].title
        
        //cell.accessoryType = dataSource[indexPath.section].items[indexPath.row].isOn ? .checkmark : .none
        
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
                UserDefaults.standard.setValue(
                    dataSource[indexPath.section].items[indexPath.row].title,
                    forKey: "theme"
                )
            }
            
        case 1:
            if !dataSource[indexPath.section].items[indexPath.row].isOn {
                dataSource[indexPath.section].items.enumerated().forEach() {index, item in
                    dataSource[indexPath.section].items[index].isOn = false
                }
                dataSource[indexPath.section].items[indexPath.row].isOn = true
                tableView.reloadData()
//                UserDefaults.standard.setValue(
//                    dataSource[indexPath.section].items[indexPath.row].title,
//                    forKey: "theme"
//                )
                
                if indexPath.row <= 1 {
                    DefaultManager.setAppLanguage(ver: indexPath.row)
                } else {
                    DefaultManager.removeAppLanguage()
                }
            }
            
        default: break
            //
        }
        
    }
}
