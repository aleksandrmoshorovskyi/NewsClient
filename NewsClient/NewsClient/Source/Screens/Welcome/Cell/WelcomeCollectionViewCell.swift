//
//  WelcomeCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import UIKit

class WelcomeCollectionViewCell: UICollectionViewCell {
    
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
        
        containerView = UIView()
        containerView.layer.cornerRadius = Constants.WelcomeCollectionViewCell_CornerRadius
        containerView.layer.borderWidth = Constants.WelcomeCollectionViewCell_BorderWidth
        containerView.layer.borderColor = UIColor.black.cgColor
        
        imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.WelcomeCollectionViewCell_CornerRadius
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
    }
    
    func setupBaseLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.WelcomeCollectionViewCell_StandartOffsets
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.WelcomeCollectionViewCell_StandartOffsets
            ),
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.WelcomeCollectionViewCell_StandartOffsets
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.WelcomeCollectionViewCell_StandartOffsets
            ),
            
            imageView.topAnchor.constraint(
                greaterThanOrEqualTo: containerView.topAnchor,
                constant: Constants.WelcomeCollectionViewCell_StandartOffsets
            ),
            imageView.widthAnchor.constraint(
                equalTo: imageView.heightAnchor,
                multiplier: Constants.WelcomeCollectionViewCell_StandartMultiplier
            ),
            imageView.centerXAnchor.constraint(
                equalTo: containerView.centerXAnchor
            ),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: .zero),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            titleLabel.heightAnchor.constraint(
                equalToConstant: Constants.WelcomeCollectionViewCell_titleLabel_heightAnchor
            )
        ])
    }
    
    func configure(with data: Country) {
        
        self.imageView.image = UIImage(named: data.rawValue)
        self.titleLabel.text = data.countryName
        
        configureUI()
    }
    
    func configureUI() {
        
        if self.isSelected {
            containerView.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            containerView.layer.borderColor = UIColor.clear.cgColor
        }
    }
}

