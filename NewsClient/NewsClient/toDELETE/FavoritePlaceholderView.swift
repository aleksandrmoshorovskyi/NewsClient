//
//  FavoritePlaceholderView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 23.06.2024.
//

import UIKit

class FavoritePlaceholderView: UIView {
    
    //weak var delegate: FavoritePlaceholderViewDelegate?
    
    var containerView: UIView!
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = Constants.BaseViewBG
        
        containerView = UIView()
        
        imageView = UIImageView(image: UIImage(systemName: "bookmark"))
        imageView.contentMode = .scaleAspectFit
        //imageView.backgroundColor = .red
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.text = "Find your saved \n articles here".localized()
        titleLabel.textAlignment = .center
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 17)
        descriptionLabel.attributedText = getTextForDescriptionLabel()
        descriptionLabel.textAlignment = .center
        
        stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        //stackView.addArrangedSubview(titleImage)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    func setupLayout() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(stackView)

        NSLayoutConstraint.activate([
            //containerView constraints
            containerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40.0),
            containerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -40.0),
            containerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            containerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20.0),
            
            //imageView constraints
            //imageView.topAnchor.constraint(greaterThanOrEqualTo: containerView.topAnchor, constant: 10.0),
            imageView.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: -10.0),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1.0),
            imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100.0),
            
            //stackView constraints
            stackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero)
        ])
    }
    
    private func getTextForDescriptionLabel() -> NSAttributedString {
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: "bookmark")?.withTintColor(.systemBlue)
        //imageAttachment.image?.withTintColor(.systemBlue)
        //imageAttachment.image?.withTintColor(.systemBlue)
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "When reading an article, tap the ".localized()))
        attributedText.append(NSAttributedString(attachment: imageAttachment))
        attributedText.append(NSAttributedString(string: "\n"))
        attributedText.append(NSAttributedString(string: "icon to save it. ".localized()))
        attributedText.append(NSAttributedString(string: "You'll be able to come back here to read it later".localized()))
        
        return attributedText
    }
}
