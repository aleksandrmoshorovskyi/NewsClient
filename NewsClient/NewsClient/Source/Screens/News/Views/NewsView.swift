//
//  NewsView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class NewsView: UIView {
    
    weak var delegate: NewsViewDelegate?
    
    //private
    let refreshControl = UIRefreshControl()
    
    //@IBOutlet
    //weak
    var activityIndicator: UIActivityIndicatorView!
    
    var placeholderData: PlaceholderDataModel?
    var placeholderView: NewsPlaceholderView?
    
    //var dataSourceCategory: [String] = ["All", "Science", "Health"]
    var dataSource: [ArticleDataModel] = []
    var maxIndexPathRow: Int = 0
    
    //var collectionViewCategory: UICollectionView!
    
    //var categoryView: CategoryView!
    
    var collectionView: UICollectionView!
    var addToFavoriteButton: UIButton!
    
    @objc func addToFavoriteButtonClicked() {
        //delegate?.addToFavoriteDidTap()
        //delegate?.addToFavorite(article: T##ArticleDataModel)
    }
    
    @objc func refreshNewsData() {
        debugPrint("It's pulled to refresh")
        //self.updateView()
        //self.refreshControl.endRefreshing()
        //self.activityIndicatorView.stopAnimating()
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
        
        // Configure Refresh Control
        //refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        refreshControl.addTarget(self, action: #selector(refreshNewsData), for: .valueChanged)
        
        //activityIndicator
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        //activityIndicator.startAnimating()
        //activityIndicator.stopAnimating()
        
        //self setup
        backgroundColor = Constants.BaseViewBG
        
        //categoryView setup
        //categoryView = CategoryView()
        //categoryView.delegate = self
        
        //collectionView setup
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //layout.estimatedItemSize = .zero
        //layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //layout.sectionInsetReference = .fromLayoutMargins
    
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.contentInsetAdjustmentBehavior = .never
        //collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemGray5
        //collectionView.isPagingEnabled = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.prefetchDataSource = self
        
        /*
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).sectionInsetReference = .fromLayoutMargins
         */
        collectionView.refreshControl = refreshControl
    }
    
    func setupLayout() {

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //categoryView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        //addSubview(categoryView)
        addSubview(activityIndicator)

        NSLayoutConstraint.activate([
            //categoryView constraints
//            categoryView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
//            categoryView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
//            categoryView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
//            categoryView.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: .zero),
//            categoryView.heightAnchor.constraint(equalToConstant: 58.0),
            
            //collectionView constraints
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: .zero),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: .zero),
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: .zero),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: .zero),
            
            //activityIndicator constraints
            activityIndicator.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor)
        ])
    }
}
