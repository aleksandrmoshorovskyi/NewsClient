//
//  CategoryView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import UIKit

typealias dataSourceCategory = (descriptionString: String, category: Category?)

class CategoryView: UIView {
    
    weak var delegate: CategoryViewDelegate?
    
    var dataSource: [(descriptionString: String, category: Category?)] = []
    //["All", "Business", "Entertainment", "General", "Health", "Science", "Sports", "Technology"]
    
    var collectionView: UICollectionView!
    
    //var selectedIndex = IndexPath(row: 0, section: 0)
    var selectedIndex: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupDataSource()
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
    
    func setupDataSource() {
        
        dataSource.append((descriptionString: "all", category: nil))
        
        Category.allCases.forEach() {
            dataSource.append((descriptionString: $0.rawValue, category: $0))
        }
    }
    
    func setupUI() {
        
        //self setup
        backgroundColor = .red
        
        //collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        //layout.estimatedItemSize = .zero
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //layout.sectionInsetReference = .fromLayoutMargins
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.contentInsetAdjustmentBehavior = .never
        //collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.showsHorizontalScrollIndicator = false
        //collectionView.backgroundColor = .systemGray5
        //collectionView.isPagingEnabled = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        //collectionView.backgroundColor = .brown
    }
    
    func setupLayout() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            //self
            self.heightAnchor.constraint(equalToConstant: 58.0),
            
            //collectionView constraints
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: .zero)
            
//            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
//            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
//            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
//            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        ])
    }
}
