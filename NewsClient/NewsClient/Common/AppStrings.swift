//
//  AppStrings.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 14.07.2024.
//

import Foundation

enum AppStrings: String {
    case WelcomeViewController_title = "welcomeViewController_title"
    case WelcomeView_titleLabel = "welcomeView_titleLabel"
    case WelcomeView_headerLabel = "welcomeView_headerLabel"
    case WelcomeView_footerLabel = "welcomeView_footerLabel"
    case WelcomeView_saveButton_title = "welcomeView_saveButton_title"
    
    case Country_countryName_Poland = "country_countryName_Poland"
    case Country_countryName_Ukraine = "country_countryName_Ukraine"
    case Country_countryName_UK = "country_countryName_UK"
    case Country_countryName_USA = "country_countryName_USA"
    case Country_countryName_Japan = "country_countryName_Japan"
    
    case Category_general = "category_general"
    case Category_business = "category_business"
    case Category_entertainment = "category_entertainment"
    case Category_health = "category_health"
    case Category_science = "category_science"
    case Category_sports = "category_sports"
    case Category_technology = "category_technology"
    
    case Theme_light = "theme_light"
    case Theme_dark = "theme_dark"
    case Theme_system = "theme_system"
    
    case HomeViewController_title = "homeViewController_title"
    case HomeViewController_navigationItem_title = "homeViewController_navigationItem_title"
    case NewsViewController_Placeholder_titleText = "newsViewController_Placeholder_titleText"
    case NewsViewController_Placeholder_descriptionText = "newsViewController_Placeholder_descriptionText"
    case NewsViewController_Placeholder_buttonTitle = "newsViewController_Placeholder_buttonTitle"
    
    case SearchViewController_title = "searchViewController_title"
    case SearchViewController_searchBar_placeholder = "searchViewController_searchBar_placeholder"
    case SearchViewController_navigationItem_prompt_empty = "searchViewController_navigationItem_prompt_empty"
    case SearchViewController_navigationItem_prompt_result = "searchViewController_navigationItem_prompt_result"
    case SearchViewController_HeaderView_No_recent_searches = "searchViewController_HeaderView_No_recent_searches"
    case SearchViewController_HeaderView_Recent_searches = "searchViewController_HeaderView_Recent_searches"
    case SearchInfoView_clearButton_title = "searchInfoView_clearButton_title"
    case SearchViewController_Placeholder_titleText = "searchViewController_Placeholder_titleText"
    case SearchViewController_Placeholder_descriptionText = "searchViewController_Placeholder_descriptionText"
    
    case FavoriteViewController_title = "favoriteViewController_title"
    case FavoriteViewController_searchBar_placeholder = "favoriteViewController_searchBar_placeholder"
    case FavoriteViewController_Placeholder_titleText = "favoriteViewController_Placeholder_titleText"
    case FavoriteViewController_Placeholder_descriptionText = "favoriteViewController_Placeholder_descriptionText"
    case FavoriteViewController_Placeholder_descriptionTextOne = "favoriteViewController_Placeholder_descriptionTextOne"
    case FavoriteViewController_Placeholder_descriptionTextTwo = "favoriteViewController_Placeholder_descriptionTextTwo"
    
    case SettingsViewController_title = "settingsViewController_title"
    case SettingsViewController_mode_title = "settingsViewController_mode_title"
    case SettingsViewController_interface_language_title = "settingsViewController_interface_language_title"
    case SettingsViewController_change_language_title = "settingsViewController_change_language_title"
    case SettingsViewController_country_title = "settingsViewController_country_title"
    
    case ArticleCollectionViewCell_shareAction_title = "articleCollectionViewCell_shareAction_title"
    case ArticleCollectionViewCell_safariAction_title = "articleCollectionViewCell_safariAction_title"
    case ArticleCollectionViewCell_saveAction_title = "articleCollectionViewCell_saveAction_title"
    case ArticleCollectionViewCell_unsaveAction_title = "articleCollectionViewCell_unsaveAction_title"
    
    case TimeConverter_now = "timeConverter_now"
    case TimeConverter_m_ago = "timeConverter_m_ago"
    case TimeConverter_h_ago = "timeConverter_h_ago"
    case TimeConverter_d_ago = "timeConverter_d_ago"
    case TimeConverter_w_ago = "timeConverter_w_ago"
    case TimeConverter_ancient = "timeConverter_ancient"
    
    case AlertController_okAletalertAction = "alertController_okAletalertAction"
    case AlertController_cancelAletalertAction = "alertController_cancelAletalertAction"
    case AlertController_error_title = "alertController_error_title"
    case AlertController_language_title = "alertController_language_title"
    case AlertController_language_message = "alertController_language_message"
     
    var localized: String {
        return self.rawValue.localized
    }
}
