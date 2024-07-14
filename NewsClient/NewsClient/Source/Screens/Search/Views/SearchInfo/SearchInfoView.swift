//
//  SearchInfoView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 10.07.2024.
//

import UIKit

class SearchInfoView: UIView {
    
    weak var delegate: SearchInfoViewDelegate?
    
    var containerView: UIView!
    
    var titleLabel: UILabel!
    var clearButton: UIButton!
    
    @objc func clearButtonDidTap() {
        delegate?.clearButtonDidTap()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
        containerView = UIView()
        containerView.backgroundColor = .systemBackground
        
        titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 13)
        titleLabel.textColor = .darkGray
        //titleLabel.backgroundColor = .systemBlue
        
        clearButton = UIButton()
        clearButton.titleLabel?.font = .systemFont(ofSize: 13)
        //clearButton.setTitle("Clear".localized(), for: .normal)
        clearButton.setTitle(
            AppStrings.SearchInfoView_clearButton_title.localized,
            for: .normal
        )
        clearButton.setTitleColor(.systemRed, for: .normal)
        clearButton.setTitleColor(.systemGray, for: .highlighted)
        clearButton.addTarget(self, action: #selector(clearButtonDidTap), for: .touchUpInside)
        clearButton.isHidden = false
        //clearButton.backgroundColor = .systemBlue
    }
    
    func setupLayout() {

        containerView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        addSubview(titleLabel)
        addSubview(clearButton)

        NSLayoutConstraint.activate([
            //self
            self.heightAnchor.constraint(equalToConstant: 58.0),
            
            //containerView containerView
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .zero),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: .zero),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: .zero),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: .zero),
            
            //titleLabel
            //titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: clearButton.leadingAnchor, constant: -10.0),
            
            //clearButton
            //clearButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            clearButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: .zero),
            clearButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20.0),
            clearButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 1.0)
        ])
    }
}
