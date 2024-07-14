//
//  SearchInfoView+Ext.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.07.2024.
//

import UIKit

extension SearchInfoView: SearchInfoViewProtocol {
    
    func showClearButton(_ show: Bool) {
        
        clearButton.isHidden = show ? false : true
    }
    
    func setupTitle(_ title: String) {
        
        titleLabel.text = title
    }
}
