//
//  CategoryView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import UIKit

//typealias dataSourceCategory = (descriptionString: String, category: Category?)

class CategoryView: UIView {
    
    weak var delegate: CategoryViewDelegate?
    
    var dataSource: [Category] = []

    var collectionView: UICollectionView!
    var selectedIndex: Int = 0
    
    required init(customParamArg: [Category]) {
        self.dataSource =  customParamArg
        super.init(frame: .zero)
        
        setupUI()
        setupLayout()
        
        collectionView.register(
            CategoryCollectionViewCell.self,
            forCellWithReuseIdentifier: CategoryCollectionViewCell.idintifier
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = .red
        
        //collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupLayout() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: Constants.CategoryView_Height),
            
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: .zero)
        ])
    }
}
