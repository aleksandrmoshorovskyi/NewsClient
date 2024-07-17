//
//  Constants.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import UIKit

enum Constants {
    
    //Notifications
    static let addedToFavoriteNotification = Notification.Name("AddedToFavoriteNotification")
    static let deletedFromFavoriteNotification = Notification.Name("DeleteFromFavoriteNotification")
    static let updateAfterErrorNotification = Notification.Name("UpdateAfterErrorNotification")
    
    //Common
    static let common_pageSizeDefaultValue: Int = 20
    
    //CommonUI
    static let common_SystemBackground: UIColor = .systemBackground
    static let common_PageTitleFont: UIFont = .boldSystemFont(ofSize: 34)
    static let common_TitleFont: UIFont = .boldSystemFont(ofSize: 17)
    static let common_SecondaryTextFont: UIFont = .systemFont(ofSize: 17)
    static let common_TertiaryTextFont: UIFont = .systemFont(ofSize: 13)
    static let common_TertiaryTextColor: UIColor = .darkGray
    static let Common_Offset: CGFloat = 10.0
    static let Common_Height: CGFloat = 35.0
    static let common_CornerRadius: CGFloat = 8.0
    static let common_Multiplier: CGFloat = 1.0
    
    //WelcomeView
    static let Welcome_SystemBackground: UIColor = common_SystemBackground
    static let welcome_pageTitleFont: UIFont = common_PageTitleFont
    static let welcome_pageSecondTitleFont: UIFont = common_SecondaryTextFont
    
    static let welcome_saveButtonBackgroundColorEnabled: UIColor? = UIColor(named: "customControlColor")
    static let welcome_saveButtonTextColorEnabled_normal: UIColor? = UIColor(named: "customControlTextColor")
    static let welcome_saveButtonTextColorEnabled_highlighted: UIColor = .gray
    static let welcome_saveButtonBackgroundColorDisabled: UIColor = .darkGray
    static let welcome_saveButtonTextColorDisabled_normal: UIColor = .lightGray
    
    static let welcome_saveButtonCornerRadius: CGFloat = common_CornerRadius
    static let welcome_saveButton_heightAnchor: CGFloat = 50.0
    static let welcome_stackView_spacing: CGFloat = 20.0
    static let welcome_containerView_side_offset: CGFloat = 30.0
    static let welcome_containerView_top_bottom_offset: CGFloat = 20.0
    
    //WelcomeCollectionViewCell
    static let WelcomeCollectionViewCell_CornerRadius: CGFloat = common_CornerRadius
    static let WelcomeCollectionViewCell_BorderWidth: CGFloat = 2.0
    static let WelcomeCollectionViewCell_StandartOffsets: CGFloat = 10.0
    static let WelcomeCollectionViewCell_StandartMultiplier: CGFloat = common_Multiplier
    static let WelcomeCollectionViewCell_titleLabel_heightAnchor: CGFloat = 20.0
    
    //ArticleCollectionViewCell
    static let ArticleCollectionViewCell_BackgroundColor: UIColor = common_SystemBackground
    static let ArticleCollectionViewCell_ImageView_BackgroundColor: UIColor = .gray
    static let ArticleCollectionViewCell_contentViewColor: UIColor = .systemGray5
    static let ArticleCollectionViewCell_menuButtonColor: UIColor = .systemGray
    static let ArticleCollectionViewCell_containerViewColor: UIColor = .clear
    static let ArticleCollectionViewCell_elementsAlpha: CGFloat = 0.6
    static let ArticleCollectionViewCell_dtTitleFont: UIFont = common_TertiaryTextFont
    static let ArticleCollectionViewCell_newsTitleFont: UIFont = common_TitleFont
    static let ArticleCollectionViewCell_CornerRadius: CGFloat = 15.0
    //static let ArticleCollectionViewCell_contentViewAlpha: CGFloat = 0.5
    //static let ArticleCollectionViewCell_titleLabelHeight: CGFloat = 35.0
    static let ArticleCollectionViewCell_titleLabelSideOffset: CGFloat = 10.0
    static let ArticleCollectionViewCell_ImageView_HeightAnchor: CGFloat = 200.0
    static let ArticleCollectionViewCell_ControlsView_HeightAnchor: CGFloat = 40.0
    static let ArticleCollectionViewCell_MenuButton_HeightAnchor: CGFloat = 50.0
    
    //NewsView+CollectionView
    static let NewsViewCollectionView_ApproximateHeight: CGFloat = 250
    static let NewsViewCollectionView_Offset: CGFloat = 10.0
    
    //HomeViewController
    static let HomeViewController_Title: CGFloat = 20.0
    
    //HomeCollectionViewCell
    static let HomeCollectionViewCell_BackgroundColor: UIColor = common_SystemBackground
    
    //HomeViewController
    static let HomeViewController_BackgroundColor: UIColor = common_SystemBackground
    
    //CategoryCollectionViewCell
    static let CategoryCollectionViewCell_BackgroundColor: UIColor = common_SystemBackground
    static let CategoryCollectionViewCell_Red_BackgroundColor: UIColor = .systemRed
    static let CategoryCollectionViewCell_controlView_heightAnchor: CGFloat = 5.0
    static let CategoryView_Height: CGFloat = 58.0
    static let CategoryView_Width: CGFloat = 200.0
    
    //SearchInfoView
    static let SearchInfoView_BackgroundColor: UIColor = common_SystemBackground
    static let SearchInfoView_clearButton_normal_Color: UIColor = .systemRed
    static let SearchInfoView_clearButton_highlighted_Color: UIColor = .systemGray
    static let SearchInfoView_Height: CGFloat = 58.0
    static let SearchInfoView_SideOffset: CGFloat = 20.0
    
    //FavoriteViewController
    static let FavoriteViewController_BackgroundColor: UIColor = common_SystemBackground
    
    //Main Tab Bar
    static let MainTabBarViewBG: UIColor = .systemBackground
    static let MainTabBarBG: UIColor = .systemGray
    
    //Base VC
    static let BaseViewBG: UIColor = .systemBackground
    
    //NewsPlaceholderView
    static let NewsPlaceholderView_stackView_spacing: CGFloat = 10.0
    static let NewsPlaceholderView_actionButton_width: CGFloat = 150.0
    static let NewsPlaceholderView_actionButton_height: CGFloat = 35.0
    static let NewsPlaceholderView_containerView_sideOffset: CGFloat = 40.0
    static let NewsPlaceholderView_containerView_topBottomOffset: CGFloat = 20.0
    static let NewsPlaceholderView_imageView_heightAnchor: CGFloat = 100.0
    
    //Settings
    static let systemSettingsImage: UIImage? = UIImage(systemName: "gearshape")
    static let systemLanguageImage: UIImage? = UIImage(systemName: "textformat.abc")
    static let changeLanguageImage: UIImage? = UIImage(systemName: "a.square")
}
