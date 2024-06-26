//
//  Constants.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import Foundation
import UIKit

enum Constants {
    
    //Notifications
    static let deleteFromFavoriteNotification = Notification.Name("DeleteFromFavoriteNotification")
    
    static let pageSizeDefaultValue: Int = 20
    
    //Main Tab Bar
    static let MainTabBarViewBG: UIColor = .systemBackground
    static let MainTabBarBG: UIColor = .systemGray
    
    //Base VC
    static let BaseViewBG: UIColor = .systemBackground
    
    //ArticleCollectionViewCell
    static let articleCellCornerRadius: CGFloat = 15.0
    static let contentViewColor: UIColor = .systemGray5
    static let contentViewAlpha: CGFloat = 0.5
    static let containerViewColor: UIColor = .clear
    static let titleLabelHeight: CGFloat = 35.0
    static let titleLabelSideOffset: CGFloat = 10.0
    
    //news
    static let newsTitleFont: UIFont = .boldSystemFont(ofSize: 17)
    static let dtTitleFont: UIFont = .systemFont(ofSize: 13)
    //static let dtTitleTextColor: UIColor = UI
}

/*
 
 ELEMENT TYPE    STYLE
 
 Page title (unscrolled)    34pt bold #000
 
 Page title (scrolled)    17pt medium #000
 
 Paragraph text,
 List item titles,
 Links                      17pt regular #000
 
 Secondary text    15pt regular #3C3C43 at 60% opacity
 
 Tertiary text,
 Captions    13pt regular #3C3C43 at 60% opacity
 
 Buttons,
 Text input controls    17pt normal, various colors
 
 Action bar labels    10pt regular #8A8A8E
 */
