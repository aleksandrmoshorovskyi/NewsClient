//
//  TopView+CollectionView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 12.06.2024.
//

import UIKit
import Kingfisher

// MARK: UICollectionView - DataSource
extension TopView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ArticleCollectionViewCell.idintifier,
            for: indexPath) as? ArticleCollectionViewCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
//        //if let data = dataSource {
//            cell.titleLabel.text = dataSource[indexPath.row].title
//        //}
//        
//        if let urlToImage = dataSource[indexPath.row].urlToImage {
//            if let url = URL(string: urlToImage) {
//                //cell.imageView.load(url: url)
//                cell.imageView.kf.setImage(with: url)
//            } else {
//                //debugPrint("no url")
//            }
//        } else {
//            //debugPrint("no urlToImage")
//            cell.imageView.image = nil
//        }
        
        cell.configure(with: dataSource[indexPath.row])
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension TopView: UICollectionViewDelegate {
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension TopView: UICollectionViewDelegateFlowLayout {
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 4.0)
        //return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3.0)
        //return CGSize(width: collectionView.frame.width - 20.0, height: 200.0)
        
        let height = collectionViewLayout.collectionViewContentSize.height
        
        return CGSize(width: collectionView.frame.width - 20.0, height: height)
    }
    */
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let sectionInset = (collectionViewLayout as! UICollectionViewFlowLayout).sectionInset
//        let referenceHeight: CGFloat = 200 // Approximate height of your cell
//        let referenceWidth = collectionView.safeAreaLayoutGuide.layoutFrame.width
//            - sectionInset.left
//            - sectionInset.right
//            - collectionView.contentInset.left
//            - collectionView.contentInset.right
//        return CGSize(width: referenceWidth, height: referenceHeight)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let referenceHeight: CGFloat = 250 // Approximate height of your cell
        let referenceWidth = collectionView.frame.width - 20.0
        
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(
            top: 10.0,
            left: 10.0,
            bottom: 10.0,
            right: 10.0
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return .zero
    }
}
