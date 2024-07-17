//
//  CategoryCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
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
        
        contentView.backgroundColor = Constants.CategoryCollectionViewCell_BackgroundColor

        containerView = UIView()
        containerView.backgroundColor = Constants.CategoryCollectionViewCell_BackgroundColor
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .center

        controlView = UIView()
    }
    
    func setupBaseLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        controlView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(containerView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(controlView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Constants.Common_Offset),
            titleLabel.heightAnchor.constraint(equalToConstant: Constants.Common_Height),
            
            controlView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            controlView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            controlView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.Common_Offset),
            controlView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            controlView.heightAnchor.constraint(equalToConstant: Constants.CategoryCollectionViewCell_controlView_heightAnchor)
        ])
    }
    
    func configure(with data: Category) {

        self.titleLabel.text = data.localized.capitalized
    }
}
