//
//  NewsView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class NewsView: UIView {
    
    weak var delegate: NewsViewDelegate?
    
    let refreshControl = UIRefreshControl()
    
    var activityIndicator: UIActivityIndicatorView!
    
    var placeholderData: PlaceholderDataModel?
    var placeholderView: NewsPlaceholderView?
    
    var dataSource: [ArticleDataModel] = []
    var maxIndexPathRow: Int = 0
    
    var collectionView: UICollectionView!
    var addToFavoriteButton: UIButton!
    
//    @objc func addToFavoriteButtonClicked() {
//        //delegate?.addToFavoriteDidTap()
//        //delegate?.addToFavorite(article: T##ArticleDataModel)
//    }
    
    @objc func refreshNewsData() {
        delegate?.refreshData()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
        
        collectionView.register(
            ArticleCollectionViewCell.self,
            forCellWithReuseIdentifier: ArticleCollectionViewCell.idintifier
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = Constants.BaseViewBG
        
        refreshControl.addTarget(self, action: #selector(refreshNewsData), for: .valueChanged)
        
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        
        //collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemGray5
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.refreshControl = refreshControl
    }
    
    func setupLayout() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero),
            
            activityIndicator.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor)
        ])
    }
}
