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
        
        /*
        guard let cell = tableView.dequeueReusableCell(withIdentifier: " ") as? CityTableViewCell
        else {
            assertionFailure()
            return UITableViewCell()
        }
         */
        
        let cell = UITableViewCell()
        
        //let currentData = dataSource[indexPath.section].items[indexPath.row]
        
        cell.textLabel?.text = dataSource[indexPath.section].items[indexPath.row].title
        
        cell.accessoryType = dataSource[indexPath.section].items[indexPath.row].isOn ? .checkmark : .none
        
        return cell
    }
}

extension SettingsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //var currentData = dataSource[indexPath.section].items[indexPath.row]
        
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
    }
}
