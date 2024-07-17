//
//  NewsPlaceholderView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.07.2024.
//

import UIKit

class NewsPlaceholderView: UIView {
    
    var dataSource: PlaceholderDataModel!
    
    var containerView: UIView!
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var descriptionLabel: UILabel!
    var actionButton: UIButton!
    var stackView: UIStackView!
    
    required init(placeholderData: PlaceholderDataModel) {
        self.dataSource = placeholderData
        super.init(frame: .zero)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        backgroundColor = Constants.BaseViewBG
        
        containerView = UIView()
        
        imageView = UIImageView(image: UIImage(systemName: dataSource.imageSystemName))
        imageView.contentMode = .scaleAspectFit
        
        titleLabel = UILabel()
        titleLabel.numberOfLines = .zero
        titleLabel.font = Constants.common_TitleFont
        titleLabel.attributedText = dataSource.titleText
        titleLabel.textAlignment = .center
        
        descriptionLabel = UILabel()
        descriptionLabel.numberOfLines = .zero
        descriptionLabel.font = Constants.common_SecondaryTextFont
        descriptionLabel.attributedText = dataSource.descriptionText
        descriptionLabel.textAlignment = .center
        
        stackView = UIStackView()
        stackView.axis = NSLayoutConstraint.Axis.vertical
        stackView.distribution = .fillEqually
        stackView.spacing = Constants.NewsPlaceholderView_stackView_spacing
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        actionButton = UIButton()
        actionButton.isHidden = true
        if let buttonTitle = dataSource.buttonTitle {
            actionButton.isHidden = false
            actionButton.frame.size = CGSize(
                width: Constants.NewsPlaceholderView_actionButton_width,
                height: Constants.NewsPlaceholderView_actionButton_height
            )
            actionButton.setTitle(buttonTitle, for: .normal)
            actionButton.setTitleColor(.systemBlue, for: .normal)
            actionButton.setTitleColor(.systemGray, for: .highlighted)
            actionButton.addTarget(self, action: #selector(forBtnAction), for: .touchUpInside)
            
            stackView.addArrangedSubview(actionButton)
        }
    }
    
    func setupLayout() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(stackView)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.NewsPlaceholderView_containerView_sideOffset
            ),
            containerView.trailingAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.trailingAnchor,
                constant: -Constants.NewsPlaceholderView_containerView_sideOffset
            ),
            containerView.topAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.topAnchor,
                constant: Constants.NewsPlaceholderView_containerView_topBottomOffset
            ),
            containerView.bottomAnchor.constraint(
                equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constants.NewsPlaceholderView_containerView_topBottomOffset
            ),
            
            imageView.bottomAnchor.constraint(
                equalTo: stackView.topAnchor,
                constant: -Constants.Common_Offset
            ),
            imageView.widthAnchor.constraint(
                equalTo: imageView.heightAnchor,
                multiplier: Constants.common_Multiplier
            ),
            imageView.centerXAnchor.constraint(
                equalTo: containerView.centerXAnchor
            ),
            imageView.heightAnchor.constraint(
                equalToConstant: Constants.NewsPlaceholderView_imageView_heightAnchor
            ),
            
            stackView.centerXAnchor.constraint(
                equalTo: containerView.centerXAnchor
            ),
            stackView.centerYAnchor.constraint(
                equalTo: containerView.centerYAnchor
            ),
            stackView.leadingAnchor.constraint(
                equalTo: containerView.leadingAnchor,
                constant: .zero
            ),
            stackView.trailingAnchor.constraint(
                equalTo: containerView.trailingAnchor,
                constant: .zero
            )
        ])
    }
    
    @objc func forBtnAction() {
        if let buttonActionCompletion = dataSource.buttonActionCompletion {
            buttonActionCompletion()
        }
    }
}
