//
//  BaseViewController.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 05.06.2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Constants.BaseViewBG
    }
    
    func baseShareAction(article: ArticleDataModel) {
        
        if let urlToArticle = article.url {
            if let url = URL(string: urlToArticle) {
                let urlToShare = [url]
                
                let activityViewController = UIActivityViewController(
                    activityItems: urlToShare,
                    applicationActivities: nil
                )
                
                activityViewController.popoverPresentationController?.sourceView = self.view
                self.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
}
