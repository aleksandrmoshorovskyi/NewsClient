//
//  ArticleCollectionViewCell.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import UIKit
import Kingfisher

class ArticleCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: ArticleCollectionViewCellDelegate?
    
    var articleDataSource: ArticleDataModel!
    
    var containerView: UIView!
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var controlsView: UIView!
    var dtLabel: UILabel!
    var menuButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupBaseUI()
        setupBaseLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBaseUI() {
        
        contentView.layer.cornerRadius = Constants.ArticleCollectionViewCell_CornerRadius
        contentView.backgroundColor = Constants.ArticleCollectionViewCell_BackgroundColor
        
        containerView = UIView()
        containerView.layer.cornerRadius = Constants.ArticleCollectionViewCell_CornerRadius
        containerView.backgroundColor = Constants.ArticleCollectionViewCell_BackgroundColor
        
        imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.ArticleCollectionViewCell_CornerRadius
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = Constants.ArticleCollectionViewCell_ImageView_BackgroundColor
        imageView.contentMode = .scaleAspectFill
        
        titleLabel = UILabel()
        titleLabel.font = Constants.ArticleCollectionViewCell_newsTitleFont
        titleLabel.numberOfLines = .zero
        
        //controlsView setup
        controlsView = UIView()
        
        dtLabel = UILabel()
        dtLabel.font = Constants.ArticleCollectionViewCell_dtTitleFont
        dtLabel.alpha = Constants.ArticleCollectionViewCell_elementsAlpha
        
        menuButton = UIButton()
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        menuButton.setPreferredSymbolConfiguration(
            UIImage.SymbolConfiguration(scale: UIImage.SymbolScale.large),
            forImageIn: .normal
        )
        menuButton.alpha = Constants.ArticleCollectionViewCell_elementsAlpha
        menuButton.tintColor = Constants.ArticleCollectionViewCell_menuButtonColor
    }
    
    func setupBaseLayout() {
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        controlsView.translatesAutoresizingMaskIntoConstraints = false
        dtLabel.translatesAutoresizingMaskIntoConstraints = false
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(containerView)
        
        containerView.addSubview(imageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(controlsView)
        
        controlsView.addSubview(dtLabel)
        controlsView.addSubview(menuButton)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.ArticleCollectionViewCell_titleLabelSideOffset
            ),
            containerView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.ArticleCollectionViewCell_titleLabelSideOffset
            ),
            containerView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Constants.ArticleCollectionViewCell_titleLabelSideOffset
            ),
            containerView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.ArticleCollectionViewCell_titleLabelSideOffset
            ),
            
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            imageView.heightAnchor.constraint(
                equalToConstant: Constants.ArticleCollectionViewCell_ImageView_HeightAnchor
            ),
            
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            titleLabel.topAnchor.constraint(
                equalTo: imageView.bottomAnchor,
                constant: Constants.ArticleCollectionViewCell_titleLabelSideOffset
            ),
            
            controlsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            controlsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            controlsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .zero),
            controlsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: .zero),
            controlsView.heightAnchor.constraint(
                equalToConstant: Constants.ArticleCollectionViewCell_ControlsView_HeightAnchor
            ),

            dtLabel.leadingAnchor.constraint(equalTo: controlsView.leadingAnchor, constant: .zero),
            dtLabel.topAnchor.constraint(equalTo: controlsView.topAnchor, constant: .zero),
            dtLabel.bottomAnchor.constraint(equalTo: controlsView.bottomAnchor, constant: .zero),
            
            menuButton.leadingAnchor.constraint(lessThanOrEqualTo: dtLabel.trailingAnchor, constant: .zero),
            menuButton.trailingAnchor.constraint(equalTo: controlsView.trailingAnchor, constant: .zero),
            menuButton.topAnchor.constraint(equalTo: controlsView.topAnchor, constant: .zero),
            menuButton.bottomAnchor.constraint(equalTo: controlsView.bottomAnchor, constant: .zero),
            menuButton.widthAnchor.constraint(
                equalToConstant: Constants.ArticleCollectionViewCell_MenuButton_HeightAnchor
            )
        ])
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        titleLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
        
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        return layoutAttributes
    }
    
    func configure(with data: ArticleDataModel) {
        
        self.titleLabel.text = data.title
        self.imageView.image = UIImage.init(named: "newsDefaultImg")
        self.dtLabel.text = TimeConverter.converteDateToPastTime(data.publishedAt)
        
        if let urlToImage = data.urlToImage {
            if let url = URL(string: urlToImage) {
                self.imageView.kf.setImage(with: url)
            }
        }
        
        self.articleDataSource = data
        
        let settingsMenu = generatePullDownMenu()
        menuButton.menu = settingsMenu
    }
    
    private func shareButtonDidTap() {
        delegate?.shareAction(article: articleDataSource)
    }
    
    private func openInSafariButtonDidTap() {
        CommonFunctions.openInSafari(article: articleDataSource)
    }
    
    private func addToFavoriteButtonDidTap() {
        debugPrint("addToFavoriteButtonDidTap")
        
        articleDataSource.isFavorite = true
        
        delegate?.addToFavorite(article: articleDataSource)
        
        self.menuButton.menu = generatePullDownMenu()
    }
    
    private func deleteFromFavoriteButtonDidTap() {
        debugPrint("deleteFromFavoriteButtonDidTap")
        
        articleDataSource.isFavorite = false
        
        delegate?.deleteFromFavorite(article: articleDataSource)
        
        self.menuButton.menu = generatePullDownMenu()
    }
    
    private func generatePullDownMenu() -> UIMenu {
        
        let isFavorite = articleDataSource.isFavorite
        
        let shareAction = UIAction(
            title: AppStrings.ArticleCollectionViewCell_shareAction_title.localized,
            image: UIImage(systemName: "square.and.arrow.up")
        ) { _ in
            self.shareButtonDidTap()
        }
        
        let safariAction = UIAction(
            title: AppStrings.ArticleCollectionViewCell_safariAction_title.localized,
            image: UIImage(systemName: "safari")
        ) { _ in
            self.openInSafariButtonDidTap()
        }
        
        let saveAction = UIAction(
            title: isFavorite ?
                AppStrings.ArticleCollectionViewCell_unsaveAction_title.localized :
                AppStrings.ArticleCollectionViewCell_saveAction_title.localized,
            image: UIImage(systemName: isFavorite ? "bookmark.fill" : "bookmark")
        ) { _ in
            if isFavorite {
                self.deleteFromFavoriteButtonDidTap()
            } else {
                self.addToFavoriteButtonDidTap()
            }
        }
         
        let subMenu = UIMenu(
            options: .displayInline,
            children: [shareAction,
                       safariAction,
                       saveAction]
        )
         
        let settingsMenu = UIMenu(
            children: [subMenu]
        )
         
        return settingsMenu
    }
}
