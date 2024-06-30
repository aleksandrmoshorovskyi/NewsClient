//
//  WelcomeView+CollectionView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 30.06.2024.
//

import UIKit

// MARK: UICollectionView - DataSource
extension WelcomeView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WelcomeCollectionViewCell.idintifier,
            for: indexPath) as? WelcomeCollectionViewCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        cell.configure(with: dataSource[indexPath.row])
        
        if selectedIndex == indexPath.row {
            cell.containerView.layer.borderColor = UIColor.systemRed.cgColor
        } else {
            cell.containerView.layer.borderColor = UIColor.clear.cgColor
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension WelcomeView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        selectedIndex = indexPath.row
        
        collectionView.reloadData()
        
        setupSaveButtonState()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension WelcomeView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        //let referenceHeight: CGFloat = 58.0 // Approximate height of your cell
        //let referenceWidth: CGFloat = 200.0 // Approximate width of your cell
        
        return CGSize(width: collectionView.bounds.width/2, height: collectionView.bounds.width/2)
    }
    
    /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(
            top: .zero,
            left: 10.0,
            bottom: .zero,
            right: 10.0
        )
    }
     */
    
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
