//
//  HomeView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class HomeView: UIView {
    
    weak var delegate: HomeViewDelegate?
    
    var dataSource: [NewsViewController] = []
    var categoriesSource: [Category] = []
    
    var categoryView: CategoryView!
    
    var collectionView: UICollectionView!
    var addToFavoriteButton: UIButton!
    
    @objc func addToFavoriteButtonClicked() {
        //delegate?.addToFavoriteDidTap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
        
        collectionView.register(
            HomeCollectionViewCell.self,
            forCellWithReuseIdentifier: HomeCollectionViewCell.idintifier
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        //self setup
        backgroundColor = Constants.BaseViewBG
        
        //categoryView setup
        //categoryView = CategoryView()
        //categoryView = CategoryView(customParamArg: categoriesSource)
        
        //MARK: TO DO !!!
        //TO CHANGE - Must work with any categoriesSource in init
        categoryView = CategoryView(customParamArg: Category.allCases)
        
        categoryView.delegate = self
        //categoryView.dataSource = categoriesSource
        
        //collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = .zero
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.showsHorizontalScrollIndicator = false
        //collectionView.backgroundColor = .systemGray5
        collectionView.isPagingEnabled = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupLayout() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        addSubview(categoryView)

        NSLayoutConstraint.activate([
            //categoryView constraints
            categoryView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
            categoryView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
            categoryView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
            categoryView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: .zero),
            categoryView.heightAnchor.constraint(equalToConstant: 58.0),
            
            //collectionView constraints
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
        ])
    }
}
