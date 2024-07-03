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
        
//        collectionView.register(
//            ArticleCollectionViewCell.self,
//            forCellWithReuseIdentifier: ArticleCollectionViewCell.idintifier
//        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        tableView = UITableView()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupLayout() {

        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(tableView)

        NSLayoutConstraint.activate([
            //tableView constraints
            tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
            tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        ])
    }
    
    func alertBeforeChangeLanguage() {
        /*
         let alert = UIAlertController(title: "Clear cash", message: "All saved weather information will be deleted from the device! (except saved locations)", preferredStyle: .alert)
         
         let aletalertAction = UIAlertAction(
             title: "OK",
             style: .destructive,
             handler: { _ in NSLog("The \"OK\" alert occured.")})
         
         let cancelAction = UIAlertAction(
             title: "Cancel",
             style: .cancel) { (action) in
             // ...
         }
         
         alert.addAction(aletalertAction)
         alert.addAction(cancelAction)
         
         self.present(alert, animated: true, completion: nil)
         */
        
//        let alertController = UIAlertController(title: "Language".localized(), message: "To change language you need to restart the application. Do you want to restart?".localized(), preferredStyle: .alert)
//
//        let okAction = UIAlertAction(title: "Yes".localized(), style: UIAlertAction.Style.default) {
//            UIAlertAction in
//            // Change update / refresh rootview controller here...
//        }
//        
//        let okAletalertAction = UIAlertAction(
//            title: "OK",
//            style: .destructive,
//            handler: { _ in NSLog("The \"OK\" alert occured.")})
//        
//        let cancelAletalertAction = UIAlertAction(
//            title: "Cancel",
//            style: .cancel) { (action) in
//            // ...
//        }
//        
//        alertController.addAction(okAletalertAction)
//        alertController.addAction(cancelAletalertAction)
//        
//        self.present(alertController, animated: true, completion: nil)
    }
}
