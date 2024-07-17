//
//  HomeView+CollectionView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit

// MARK: UICollectionView - DataSource
extension HomeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HomeCollectionViewCell.idintifier,
            for: indexPath) as? HomeCollectionViewCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
            
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        let VC = dataSource[indexPath.row]
        VC.view.frame = cell.contentView.frame
        
        cell.contentView.addSubview(VC.view)
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension HomeView: UICollectionViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let scrollPosition = scrollView.contentOffset.x / scrollView.bounds.width
        let currentPosition = scrollPosition.isNaN ? 0 : Int(round(scrollPosition))

        categoryView.setupCategory(index: currentPosition)
        categoryView.scrollToCategory(indexPath: IndexPath(row: currentPosition, section: 0))
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension HomeView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return collectionView.bounds.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        return .zero
    }
}
