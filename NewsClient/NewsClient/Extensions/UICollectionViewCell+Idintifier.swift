//
//  UICollectionViewCell+Idintifier.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import UIKit

extension UICollectionViewCell {
    
    static var idintifier: String {
        
        get {
            return String(describing: self)
        }
    }
}
