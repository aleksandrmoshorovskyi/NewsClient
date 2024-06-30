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
        titleLabel.numberOfLines = 2
        titleLabel.font = Constants.pageTitleFont
        titleLabel.text = "Get the most relevant to you".localized()
        titleLabel.textAlignment = .center
        
        headerLabel = UILabel()
        headerLabel.numberOfLines = 2
        headerLabel.font = Constants.pageSecondTitleFont
        headerLabel.text = "Please select country which news do you prefer:".localized()
        headerLabel.textAlignment = .center
        
        footerLabel = UILabel()
        footerLabel.numberOfLines = 2
        footerLabel.font = Constants.pageSecondTitleFont
        footerLabel.text = "You can change it anytime from your settings screen.".localized()
        footerLabel.textAlignment = .center
        
        //collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = .zero
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsVerticalScrollIndicator = false
        //collectionView.backgroundColor = .systemGray5
        //collectionView.isPagingEnabled = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        saveButton = UIButton()
        saveButton.layer.cornerRadius = 8.0
//        saveButton.backgroundColor = Constants.saveButtonColor
//        saveButton.setTitleColor(Constants.saveButtonTextColor, for: .normal)
//        saveButton.setTitleColor(.gray, for: .highlighted)
        saveButton.setTitle("Save and continue".localized(), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        
        headerStackView = UIStackView()
        headerStackView.axis = NSLayoutConstraint.Axis.vertical
        headerStackView.spacing = 20
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(headerLabel)
        
        footerStackView = UIStackView()
        footerStackView.axis = NSLayoutConstraint.Axis.vertical
        footerStackView.spacing = 20
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
        //containerView.addSubview(saveButton)

        NSLayoutConstraint.activate([
            //containerView constraints
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30.0),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -30.0),
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
            
            //headerStackView constraints
            headerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            headerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            headerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            //headerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            
            //collectionView constraints
            collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: headerStackView.bottomAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: footerStackView.topAnchor, constant: .zero),
            
            //footerStackView constraints
            footerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            footerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            //footerStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            footerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            
            //saveButton constraints
            saveButton.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
    
    func setupSaveButtonState() {
        
        saveButton.isEnabled = selectedIndex == nil ? false : true
        
        if saveButton.isEnabled {
            saveButton.backgroundColor = Constants.saveButtonColor
            saveButton.setTitleColor(Constants.saveButtonTextColor, for: .normal)
            saveButton.setTitleColor(.gray, for: .highlighted)
        } else {
            saveButton.backgroundColor = .darkGray
            saveButton.setTitleColor(.lightGray, for: .normal)
        }
    }
}
