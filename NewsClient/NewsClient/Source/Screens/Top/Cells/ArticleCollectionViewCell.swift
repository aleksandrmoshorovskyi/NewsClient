//
//  ArticleCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    var containerView: UIView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBaseUI()
        setupBaseLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBaseUI() {
        
        //self setup
        //self.backgroundColor = Constant.baseCellBackgroundColor
        
        //contentView setup
        contentView.layer.cornerRadius = Constants.articleCellCornerRadius
        contentView.backgroundColor = Constants.contentViewColor
        contentView.alpha = Constants.contentViewAlpha
        
        //titleLabel setup
        titleLabel = UILabel()
        
        //containerView setup
        containerView = UIView()
        containerView.backgroundColor = Constants.containerViewColor
    }
    
    func setupBaseLayout() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        //.alpha = 0.5
        contentView.addSubview(titleLabel)
        contentView.addSubview(containerView)
        
        //.alpha = 1
        //addSubview(titleLabel)
        //addSubview(containerView)
        
        NSLayoutConstraint.activate([
            // MARK: titleLabel constraints
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Constants.titleLabelSideOffset),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.titleLabelSideOffset),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.titleLabelHeight),
            
            // MARK: collectionView constraints
            containerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .zero),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero)
        ])
    }
}
