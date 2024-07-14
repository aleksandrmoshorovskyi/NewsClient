//
//  CategoryView+CollectionView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 16.06.2024.
//

import UIKit

// MARK: UICollectionView - DataSource
extension CategoryView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCollectionViewCell.idintifier,
            for: indexPath) as? CategoryCollectionViewCell
        else {
            assertionFailure()
            return UICollectionViewCell()
        }
        
        //cell.configure(with: dataSource[indexPath.row].descriptionString)
        cell.configure(with: dataSource[indexPath.row])
        
//        if selectedIndex == indexPath {
//            cell.backgroundColor = UIColor.black
//        }
        
        if selectedIndex == indexPath.row {
            cell.controlView.backgroundColor = .systemRed
            //cell.titleLabel.font = .boldSystemFont(ofSize: 17.0)
        } else {
            cell.controlView.backgroundColor = .systemBackground
            //cell.titleLabel.font = .systemFont(ofSize: 17.0)
        }
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension CategoryView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("didSelectItemAt - \(indexPath.row)")

        selectedIndex = indexPath.row
        
        //delegate?.categoryDidTap(dataSource[indexPath.row].category)
        
        delegate?.categoryAtIndexDidTap(indexPath.row)
        
        collectionView.reloadData()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension CategoryView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let referenceHeight: CGFloat = 58.0 // Approximate height of your cell
        let referenceWidth: CGFloat = 200.0 // Approximate width of your cell
        
        return CGSize(width: referenceWidth, height: referenceHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(
            top: .zero,
            left: 10.0,
            bottom: .zero,
            right: 10.0
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10.0
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
