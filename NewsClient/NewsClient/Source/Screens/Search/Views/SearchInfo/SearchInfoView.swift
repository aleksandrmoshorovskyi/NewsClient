//
//  SearchInfoView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 10.07.2024.
//

import UIKit

class SearchInfoView: UIView {
    
    weak var delegate: SearchInfoViewDelegate?
    
    var containerView: UIView!    
    var titleLabel: UILabel!
    var clearButton: UIButton!
    
    @objc func clearButtonDidTap() {
        delegate?.clearButtonDidTap()
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
        
        containerView = UIView()
        containerView.backgroundColor = Constants.SearchInfoView_BackgroundColor
        
        titleLabel = UILabel()
        titleLabel.font = Constants.common_TertiaryTextFont
        titleLabel.textColor = Constants.common_TertiaryTextColor
        
        clearButton = UIButton()
        clearButton.titleLabel?.font = Constants.common_TertiaryTextFont
        clearButton.setTitle(
            AppStrings.SearchInfoView_clearButton_title.localized,
            for: .normal
        )
        clearButton.setTitleColor(Constants.SearchInfoView_clearButton_normal_Color, for: .normal)
        clearButton.setTitleColor(Constants.SearchInfoView_clearButton_highlighted_Color, for: .highlighted)
        clearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        clearButton.isHidden = false
    }
    
    func setupLayout() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        addSubview(titleLabel)
        addSubview(clearButton)

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constants.SearchInfoView_Height),
            
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: .zero),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: Constants.SearchInfoView_SideOffset),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: clearButton.leadingAnchor, constant: -Constants.Common_Offset),
            
            clearButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            clearButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -Constants.SearchInfoView_SideOffset),
            clearButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: Constants.common_Multiplier)
        ])
    }
}
