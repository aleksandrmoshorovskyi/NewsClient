//
//  HomeCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    var containerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.backgroundColor = Constants.HomeCollectionViewCell_BackgroundColor
        containerView = UIView()
        containerView.backgroundColor = Constants.HomeCollectionViewCell_BackgroundColor
    }
    
    func setupLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .zero),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .zero),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .zero),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .zero),
        ])
    }
    
    func configure(with data: String) {
        
        //self.titleLabel.text = data.capitalized
    }
}
