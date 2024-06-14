//
//  ArticleCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import UIKit

class ArticleCollectionViewCell: UICollectionViewCell {
    
    var containerView: UIView!
    var imageView: UIImageView!
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
        contentView.backgroundColor = .white //Constants.contentViewColor
        //contentView.alpha = Constants.contentViewAlpha
        
        //containerView setup
        containerView = UIView()
        containerView.layer.cornerRadius = Constants.articleCellCornerRadius
        containerView.backgroundColor = .white //Constants.containerViewColor
        
        //imageView
        imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.articleCellCornerRadius
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .gray
        //imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFill
        
        //titleLabel setup
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
    }
    
    func setupBaseLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            //collectionView constraints
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            
            //imageView
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            //imageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: .zero),
            imageView.heightAnchor.constraint(equalToConstant: 200.0),
            
            //titleLabel constraints
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10.0),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10.0),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.0),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0)
        ])
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        titleLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
        
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        return layoutAttributes
    }
}
