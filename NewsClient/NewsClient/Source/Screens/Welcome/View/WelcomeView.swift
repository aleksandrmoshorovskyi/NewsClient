//
//  WelcomeView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import UIKit

class WelcomeView: UIView {
    
    weak var delegate: WelcomeViewDelegate?
    
    var dataSource: [Country] = []
    var selectedIndex: Int?
    
    var containerView: UIView!
    
    var titleLabel: UILabel!
    var headerLabel: UILabel!
    var footerLabel: UILabel!
    
    var collectionView: UICollectionView!
    var saveButton: UIButton!
    
    var headerStackView: UIStackView!
    var footerStackView: UIStackView!
    
    @objc func saveButtonClicked() {
        
        if let selectedIndex = selectedIndex {
            DefaultManager.setAppCountry(dataSource[selectedIndex])
        }
        
        delegate?.saveButtonDidTap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
        setupSaveButtonState()
        
        collectionView.register(
            WelcomeCollectionViewCell.self,
            forCellWithReuseIdentifier: WelcomeCollectionViewCell.idintifier
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        containerView = UIView()
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = .zero
        titleLabel.font = Constants.welcome_pageTitleFont
        titleLabel.text = AppStrings.WelcomeView_titleLabel.localized
        titleLabel.textAlignment = .center
        
        headerLabel = UILabel()
        headerLabel.numberOfLines = .zero
        headerLabel.font = Constants.welcome_pageSecondTitleFont
        headerLabel.text = AppStrings.WelcomeView_headerLabel.localized
        headerLabel.textAlignment = .center
        
        footerLabel = UILabel()
        footerLabel.numberOfLines = .zero
        footerLabel.font = Constants.welcome_pageSecondTitleFont
        footerLabel.text = AppStrings.WelcomeView_footerLabel.localized
        footerLabel.textAlignment = .center
        
        //collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        saveButton = UIButton()
        saveButton.layer.cornerRadius = Constants.welcome_saveButtonCornerRadius
        saveButton.setTitle(AppStrings.WelcomeView_saveButton_title.localized, for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        headerStackView = UIStackView()
        headerStackView.axis = NSLayoutConstraint.Axis.vertical
        headerStackView.spacing = Constants.welcome_stackView_spacing
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(headerLabel)
        
        footerStackView = UIStackView()
        footerStackView.axis = NSLayoutConstraint.Axis.vertical
        footerStackView.spacing = Constants.welcome_stackView_spacing
        footerStackView.addArrangedSubview(footerLabel)
        footerStackView.addArrangedSubview(saveButton)
    }
    
    func setupLayout() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        headerStackView.translatesAutoresizingMaskIntoConstraints = false
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(collectionView)
        containerView.addSubview(headerStackView)
        containerView.addSubview(footerStackView)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.welcome_containerView_side_offset
            ),
            containerView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                constant: -Constants.welcome_containerView_side_offset
            ),
            containerView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: Constants.welcome_containerView_top_bottom_offset
            ),
            containerView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constants.welcome_containerView_top_bottom_offset
            ),
            
            headerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            headerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            headerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: footerStackView.topAnchor, constant: .zero),
            
            footerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            footerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            footerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            
            saveButton.heightAnchor.constraint(equalToConstant: Constants.welcome_saveButton_heightAnchor)
        ])
    }
    
    func setupSaveButtonState() {
        
        saveButton.isEnabled = selectedIndex == nil ? false : true
        
        if saveButton.isEnabled {
            saveButton.backgroundColor = Constants.welcome_saveButtonBackgroundColorEnabled
            saveButton.setTitleColor(Constants.welcome_saveButtonTextColorEnabled_normal, for: .normal)
            saveButton.setTitleColor(Constants.welcome_saveButtonTextColorEnabled_highlighted, for: .highlighted)
        } else {
            saveButton.backgroundColor = Constants.welcome_saveButtonBackgroundColorDisabled
            saveButton.setTitleColor(Constants.welcome_saveButtonTextColorDisabled_normal, for: .normal)
        }
    }
}
