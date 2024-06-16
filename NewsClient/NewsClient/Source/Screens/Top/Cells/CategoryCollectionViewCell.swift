//
//  CategoryCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //weak var delegate: ArticleCollectionViewCellDelegate?
    
    var containerView: UIView!
    var titleLabel: UILabel!
    var controlView: UIView!
    
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
        //contentView.layer.cornerRadius = Constants.articleCellCornerRadius
        contentView.backgroundColor = .systemBackground //.white //Constants.contentViewColor
        //contentView.alpha = Constants.contentViewAlpha
        
        //containerView setup
        containerView = UIView()
        //containerView.layer.cornerRadius = Constants.articleCellCornerRadius
        containerView.backgroundColor = .systemBackground //.white //Constants.containerViewColor
        
        //titleLabel setup
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        //titleLabel.font = Constants.newsTitleFont

        //controlsView setup
        controlView = UIView()
        //controlView.backgroundColor = .systemRed
    }
    
    func setupBaseLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        controlView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(controlView)
        
        NSLayoutConstraint.activate([
            //collectionView constraints
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero),
            
            //titleLabel constraints
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10.0),
            //titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 35.0),
            
            //controlView constraints
            controlView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            controlView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            controlView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            controlView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            controlView.heightAnchor.constraint(equalToConstant: 5.0)
        ])
    }
    
//    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
//        
//        //titleLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.right
//        
//        //layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
//        
//        //titleLabel.preferredMaxLayoutWidth = layoutAttributes.size.width
//        
//        return layoutAttributes
//    }
    
    func configure(with data: String) {
        
        self.titleLabel.text = data.capitalized
        
        //configureUI()
    }
    
    func configureUI() {
        
        if self.isSelected {
            self.backgroundColor = .systemRed
        } else {
            self.backgroundColor = .systemBackground
        }
    }
}

