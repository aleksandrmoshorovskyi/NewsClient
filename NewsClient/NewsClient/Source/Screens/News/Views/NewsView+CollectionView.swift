//
//  NewsView+CollectionView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit
import Kingfisher

// MARK: UICollectionView - DataSource
extension NewsView: UICollectionViewDataSource {
    
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
        
        cell.configure(with: dataSource[indexPath.row])
        cell.delegate = self
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension NewsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: true)
        
        delegate?.newsRowDidTapAt(dataSource[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        let indexPathRow = indexPath.row
        
        if indexPathRow > 0 {
            
            if indexPathRow == dataSource.count/2 {
                
                if indexPathRow > maxIndexPathRow {
                    
                    maxIndexPathRow = indexPathRow
                    delegate?.loadNextPageIfExists()
                }
            }
        }
    }
    
}

// MARK: UICollectionViewDelegateFlowLayout
extension NewsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let referenceHeight: CGFloat = Constants.NewsViewCollectionView_ApproximateHeight
        let referenceWidth = collectionView.frame.width - Constants.NewsViewCollectionView_Offset * 2
        
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(
            top: Constants.NewsViewCollectionView_Offset,
            left: Constants.NewsViewCollectionView_Offset,
            bottom: Constants.NewsViewCollectionView_Offset,
            right: Constants.NewsViewCollectionView_Offset
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return Constants.NewsViewCollectionView_Offset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return Constants.NewsViewCollectionView_Offset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return .zero
    }
}

