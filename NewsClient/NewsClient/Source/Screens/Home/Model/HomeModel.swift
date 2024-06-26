//
//  HomeModel.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import Foundation

class HomeModel {
    
    //let myNotification = Notification.Name("MyNotification")
    
//    let observer = NotificationCenter.default.addObserver(forName: myNotification, object: nil, queue: nil) { (notification) in
//        print(notification.userInfo?["message"])
//    }
    
//    let observer = NotificationCenter.default.addObserver(
//        forName: Notification.Name("MyNotification"),
//        object: nil,
//        queue: nil) { (notification) in
//            print(notification.userInfo?["message"] ?? "")
//    }
    
    weak var delegate: HomeModelDelegate?
    
    let networkService: NetworkServiceProtocol
    let storageService: CoreDataServiceProtocol
    
    init(delegate: HomeModelDelegate? = nil) {
        self.delegate = delegate
        self.networkService = ServiceProvider.networkService()
        self.storageService = ServiceProvider.coreDataService()
    }
}
