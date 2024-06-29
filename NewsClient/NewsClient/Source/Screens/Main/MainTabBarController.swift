//
//  MainTabBarController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        //view.backgroundColor = Constants.MainTabBarViewBG
        //tabBar.backgroundColor = Constants.MainTabBarBG
        
        //HOME
        let homeNavigationController = UINavigationController()
        let homeViewController = HomeViewController()
        homeViewController.tabBarItem.title = "Home".localized()
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        homeViewController.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        homeNavigationController.setViewControllers([homeViewController], animated: false)
        
        //SEARCH
        let searchNavigationController = UINavigationController()
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem.title = "Search".localized()
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        searchViewController.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        searchNavigationController.setViewControllers([searchViewController], animated: false)
        
        //FAVORITE
        let favoriteNavigationController = UINavigationController()
        let favoriteViewController = FavoriteViewController()
        favoriteViewController.tabBarItem.title = "Favorites".localized()
        favoriteViewController.tabBarItem.image = UIImage(systemName: "star")
        favoriteViewController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        favoriteNavigationController.setViewControllers([favoriteViewController], animated: false)
        
        //SETTINGS
        let settingsNavigationController = UINavigationController()
        let settingsViewController = SettingsViewController()
        settingsViewController.tabBarItem.title = "Settings".localized()
        settingsViewController.tabBarItem.image = UIImage(systemName: "gearshape")
        settingsViewController.tabBarItem.selectedImage = UIImage(systemName: "gearshape.fill")
        settingsNavigationController.setViewControllers([settingsViewController], animated: false)
        
        setViewControllers([
            homeNavigationController,
            searchNavigationController,
            favoriteNavigationController,
            settingsNavigationController
        ], animated: true)
    }
}
