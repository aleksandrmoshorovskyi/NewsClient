//
//  SettingsView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 29.06.2024.
//

import UIKit

class SettingsView: UIView {
    
    weak var delegate: SettingsViewDelegate?
    
    var dataSource: [SettingsDataModel] = []

    var tableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupLayout() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        ])
    }
}
