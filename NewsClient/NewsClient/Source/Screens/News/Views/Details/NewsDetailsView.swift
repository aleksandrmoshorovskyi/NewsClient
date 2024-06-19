//
//  NewsDetailsView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 19.06.2024.
//

import UIKit
import WebKit

class NewsDetailsView: UIView {
    
    weak var delegate: NewsDetailsViewDelegate?
    
    var dataSource: ArticleDataModel!
    
    var webView: WKWebView!
    var addToFavoriteButton: UIButton!
    
    @objc func addToFavoriteButtonClicked() {
        delegate?.addToFavoriteDidTap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        //self setup
        backgroundColor = Constants.BaseViewBG
        
        //webView
        webView = WKWebView()
    }
    
    func setupLayout() {

        webView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(webView)

        NSLayoutConstraint.activate([
            //webView constraints
            webView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
            webView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
            webView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
            webView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        ])
    }
}
