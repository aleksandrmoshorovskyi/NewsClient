//
//  WelcomeCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import UIKit

class WelcomeCollectionViewCell: UICollectionViewCell {
    
    //weak var delegate: ArticleCollectionViewCellDelegate?
    
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
        
        //contentView.backgroundColor = .gray
        
        containerView = UIView()
        containerView.layer.cornerRadius = 8.0
        containerView.layer.borderWidth = 2.0
        containerView.layer.borderColor = UIColor.black.cgColor
        //containerView.backgroundColor = .gray
        
        //imageView
        imageView = UIImageView()
        imageView.layer.cornerRadius = 8.0
        imageView.layer.masksToBounds = true
        //imageView.backgroundColor = .brown
        //imageView.contentMode = .scaleAspectFit
        //imageView.contentMode = .scaleAspectFill
        imageView.contentMode = .scaleAspectFit
        //imageView.clipsToBounds - ???
        
        //titleLabel setup
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        //titleLabel.font = Constants.newsTitleFont
    }
    
    func setupBaseLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            //containerView constraints
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            
            //titleLabel constraints
            //imageView.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 10.0),
            //imageView.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -10.0),
            imageView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: 10.0),
            //imageView.bottomAnchor.constraint(lessThanOrEqualTo: titleLabel.topAnchor, constant: -10.0),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            //titleLabel constraints
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: .zero),
            titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            titleLabel.heightAnchor.constraint(equalToConstant: 20.0)
        ])
    }
    
    func configure(with data: Country) {
        
        self.imageView.image = UIImage(named: data.rawValue)
        //self.titleLabel.text = data.countryName.localized()
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

