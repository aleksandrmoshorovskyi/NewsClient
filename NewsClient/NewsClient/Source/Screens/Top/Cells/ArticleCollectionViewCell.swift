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
    
    //var urlToArticle: String!
    
    var containerView: UIView!
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var controlsView: UIView!
    var dtLabel: UILabel!
    var menuButton: UIButton!
    
    @objc func menuButtonDidTap() {
        //delegate?.addButtonDidTap()
        debugPrint("menuButtonDidTap")
    }
    
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
        contentView.backgroundColor = .systemBackground //.white //Constants.contentViewColor
        //contentView.alpha = Constants.contentViewAlpha
        
        //containerView setup
        containerView = UIView()
        containerView.layer.cornerRadius = Constants.articleCellCornerRadius
        containerView.backgroundColor = .systemBackground //.white //Constants.containerViewColor
        
        //imageView
        imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.articleCellCornerRadius
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .gray
        //imageView.contentMode = .scaleAspectFit
        imageView.contentMode = .scaleAspectFill
        
        //titleLabel setup
        titleLabel = UILabel()
        titleLabel.font = Constants.newsTitleFont
        titleLabel.numberOfLines = 0
        //titleLabel.lineBreakMode = .byWordWrapping
        //titleLabel.lineBreakMode = .byClipping
        //titleLabel.lineBreakMode = .byTruncatingTail
        //titleLabel.textAlignment = .justified
        //titleLabel.lineBreakStrategy = NSParagraphStyle.LineBreakStrategy.hangulWordPriority
        //titleLabel.hyphenationFactor
        //titleLabel.sizeToFit()
        
        //controlsView setup
        controlsView = UIView()
        
        //dtLabel setup
        dtLabel = UILabel()
        dtLabel.font = Constants.dtTitleFont
        dtLabel.alpha = 0.6
        
        //menuButton setup
        //let settingsMenu = generatePullDownMenu()
//
//        menuButton = UIButton(
//            image: UIImage(systemName: "ellipsis"),
//            menu: settingsMenu
//        )
        
        menuButton = UIButton()
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        menuButton.setPreferredSymbolConfiguration(
            UIImage.SymbolConfiguration(scale: UIImage.SymbolScale.large),
            forImageIn: .normal
        )
        //menuButton.menu = settingsMenu
        //menuButton.setImage(UIImage(systemName: ""), for: .selected)
        //menuButton.tintColor = .white
        //menuButton.setTitle("BTN", for: .normal)
        menuButton.alpha = 0.6
        menuButton.tintColor = .systemGray
        //menuButton.backgroundColor = .red
        //menuButton.addTarget(self, action: #selector(menuButtonDidTap), for: .touchUpInside)
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
//            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10.0),
//            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10.0),
//            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.0),
//            //titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0),
            
            //titleLabel constraints
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10.0),
            //titleLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0),
            
            //controlsView constraints/
            controlsView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: .zero),
            controlsView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: .zero),
            controlsView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10.0),
            controlsView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10.0),
            controlsView.heightAnchor.constraint(equalToConstant: 20.0),
            
            //dtLabel setup
            dtLabel.leadingAnchor.constraint(equalTo: controlsView.leadingAnchor, constant: .zero),
            //dtLabel.trailingAnchor.constraint(equalTo: controlsView.trailingAnchor, constant: .zero),
            dtLabel.topAnchor.constraint(equalTo: controlsView.topAnchor, constant: .zero),
            dtLabel.bottomAnchor.constraint(equalTo: controlsView.bottomAnchor, constant: .zero),
            
            //menuButton setup
            menuButton.leadingAnchor.constraint(lessThanOrEqualTo: dtLabel.trailingAnchor, constant: 10.0),
            menuButton.trailingAnchor.constraint(equalTo: controlsView.trailingAnchor, constant: -10.0),
            menuButton.topAnchor.constraint(equalTo: controlsView.topAnchor, constant: .zero),
            menuButton.bottomAnchor.constraint(equalTo: controlsView.bottomAnchor, constant: .zero)
        ])
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        
        titleLabel.preferredMaxLayoutWidth = layoutAttributes.size.width - contentView.layoutMargins.left - contentView.layoutMargins.left
        
        layoutAttributes.bounds.size.height = systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        
        return layoutAttributes
    }
    
    private func strFor(_ timeInt: Int) -> String {
        
        var str = ""
        
        let minute: Int = 60
        let hour: Int = 60*60
        let day: Int = 60*60*24
//        let twoDays: Int = 60*60*24*2
        let threeDays: Int = 60*60*24*3
        let week: Int = 60*60*24*7
        let weeksInYear = 60*60*24*7*52
        
        switch timeInt {
        case 0...minute:
            str = "now"
        case minute...hour:
            str = "\(timeInt/minute)m ago"
        case hour...threeDays:
            str = "\(timeInt/hour)h ago"
//        case day...twoDays:
//            str = "1d \((timeInt - day)/hour)h ago"
//        case twoDays...threeDays:
//            str = "2d \((timeInt - twoDays)/hour)h ago"
        case threeDays...week:
            str = "\(timeInt/day)d ago"
        case week...weeksInYear:
            str = "\(timeInt/week)w ago"
        default:
            str = "ancient"
        }
        
        return str
    }
    
    private func converteDateToPastTime(_ dateStr: String?) -> String {
        
        var strPastTime = ""
        
        if let str = dateStr {
            
            //2024-06-14T12:09:53Z
            let isoDate = str//"2016-04-14T10:44:00+0000"

            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
            //dateFormatter.timeZone = .autoupdatingCurrent
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            let date = dateFormatter.date(from:isoDate)!
            
            //debugPrint("\(date)")
            //let date = Date(from: str as! Decoder)
            
            let timeInterval = date.timeIntervalSinceNow //date.timeIntervalSince1970
            
            //debugPrint("\(Int(timeInterval))")
            
            let timeIntervalInt = Int(timeInterval)
            
            let timeIntervalSinceNow = timeIntervalInt > 0 ? timeIntervalInt : timeIntervalInt * (-1)
            
            strPastTime = strFor(timeIntervalSinceNow)
        }
        
        return strPastTime
    }
    
    func configure(with data: ArticleDataModel) {
        
        self.titleLabel.text = data.title
        self.imageView.image = UIImage.init(named: "newsDefaultImg")
        self.dtLabel.text = converteDateToPastTime(data.publishedAt)
        
        if let urlToImage = data.urlToImage {
            if let url = URL(string: urlToImage) {
                self.imageView.kf.setImage(with: url)
            }
        }
        
        //self.urlToArticle = data.url
        self.articleDataSource = data
        
        let settingsMenu = generatePullDownMenu()
        menuButton.menu = settingsMenu
    }
    
    private func shareButtonDidTap() {
        debugPrint("shareButtonDidTap")
    }
    
    private func openInSafariButtonDidTap() {
        //debugPrint("openInSafariButtonDidTap")
        
        //MARK: TODO - add qustion here
        
        if let urlToArticle = self.articleDataSource.url {
            if let url = URL(string: urlToArticle) {
                UIApplication.shared.open(url) {_ in
                    //code
                }
            }
        }
    }
    
    ///
    ///
    
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
//        if let isFavorite = articleDataSource.isFavorite {
//            <#statements#>
//        }
        
        let safariAction = UIAction(
            title: "Open in Safari",
            image: UIImage(systemName: "safari")
        ) { _ in
            self.openInSafariButtonDidTap()
        }
        
        let saveAction = UIAction(
            title: isFavorite ? "Unsave" : "Save",
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
            children: [safariAction, saveAction]
        )
         
        let settingsMenu = UIMenu(
            children: [subMenu]
        )
         
        return settingsMenu
    }
}
