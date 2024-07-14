////
////  TopView.swift
////  NewsClient
////
////  Created by Aleksandr Moroshovskyi on 12.06.2024.
////
//
//import UIKit
//
//class TopView: UIView {
//    
//    weak var delegate: TopViewDelegate?
//    
//    //var dataSourceCategory: [String] = ["All", "Science", "Health"]
//    var dataSource: [ArticleDataModel] = []
//    
//    //var collectionViewCategory: UICollectionView!
//    
//    var categoryView: CategoryView!
//    
//    var collectionView: UICollectionView!
//    var addToFavoriteButton: UIButton!
//    
//    @objc func addToFavoriteButtonClicked() {
//        delegate?.addToFavoriteDidTap()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        
//        setupUI()
//        setupLayout()
//        
//        collectionView.register(
//            ArticleCollectionViewCell.self,
//            forCellWithReuseIdentifier: ArticleCollectionViewCell.idintifier
//        )
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupUI() {
//        
//        //self setup
//        backgroundColor = Constants.BaseViewBG
//        
//        //categoryView setup
//        categoryView = CategoryView(customParamArg: Category.allCases)
//        categoryView.delegate = self
//        
//        //collectionView setup
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        //layout.estimatedItemSize = .zero
//        //layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        //layout.sectionInsetReference = .fromLayoutMargins
//    
//        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        //collectionView.contentInsetAdjustmentBehavior = .never
//        //collectionView.contentInsetAdjustmentBehavior = .always
//        collectionView.showsVerticalScrollIndicator = false
//        collectionView.backgroundColor = .systemGray5
//        //collectionView.isPagingEnabled = true
//        
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.prefetchDataSource = self
//        
//        /*
//        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInsetReference = .fromLayoutMargins
//         */
//    }
//    
//    func setupLayout() {
//
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        categoryView.translatesAutoresizingMaskIntoConstraints = false
//        
//        addSubview(collectionView)
//        addSubview(categoryView)
//
//        NSLayoutConstraint.activate([
//            //categoryView constraints
//            categoryView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
//            categoryView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
//            categoryView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
//            categoryView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: .zero),
//            categoryView.heightAnchor.constraint(equalToConstant: 58.0),
//            
//            //collectionView constraints
//            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
//            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
//            //collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
//            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero)
//        ])
//    }
//}
//
///*
// safeAreaInsets
// The insets that you use to determine the safe area for this view.
// Вставки, які ви використовуєте для визначення безпечної зони для цього перегляду.
// 
// safeAreaLayoutGuide
// The layout guide representing the portion of your view that is unobscured by bars and
// other content.
// Посібник макета, який представляє частину вашого перегляду, яка не закрита смужками та
// інший вміст.
// */
