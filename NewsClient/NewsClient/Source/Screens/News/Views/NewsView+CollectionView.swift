//
//  NewsView+CollectionView.swift
//  NewsClient
//
//  Created by Aleksandr Moroshovskyi on 17.06.2024.
//

import UIKit
import Kingfisher

// MARK: UICollectionView - UICollectionViewDataSourcePrefetching
extension NewsView: UICollectionViewDataSourcePrefetching {
    
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        debugPrint("prefetchItemsAt")
        
        for indexPath in indexPaths {
            //let model = models[indexPath.row]
            //asyncFetcher.fetchAsync(model.identifier)
            debugPrint("prefetchItemsAt - \(indexPath.row)")
        }
    }
}

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
        //print("\(indexPath.row)")
        
        let indexPathRow = indexPath.row
        //var tempindexPathRow = 0
        
        if indexPathRow > 0 {
//            if Double(Constants.pageSizeDefaultValue) / Double(indexPath.row) <= 2.0 {
//                print("\(indexPath.row)")
//                //add next page
//                //delegate.
//            }
            
//            if Double(dataSource.count) / Double(indexPath.row) >= 2.0 &&
//                Double(dataSource.count) / Double(indexPath.row) < 3.0 {
//                print("\(indexPath.row)")
//                //add next page
//                //delegate.
//            }
            
            //if indexPathRow > tempindexPathRow {
            //    print("\(indexPath.row)")
            //}
            
            //tempindexPathRow = indexPathRow
//            if indexPathRow > maxIndexPathRow {
//                debugPrint("\(indexPathRow)")
//                maxIndexPathRow = indexPathRow
//            }
//            
//            if maxIndexPathRow >= dataSource.count/2 {
//                debugPrint("here we have to prefetchdata")
//            }
            
            if indexPathRow == dataSource.count/2 {
                if indexPathRow > maxIndexPathRow {
                    debugPrint("dataSource - \(dataSource.count)")
                    debugPrint("dataSource/2 - \(dataSource.count/2)")
                    debugPrint("indexPathRow - \(indexPathRow)")
                    maxIndexPathRow = indexPathRow
                    debugPrint("here we have to prefetchdata")
                    delegate?.loadNextPageIfExists()
                }
            }
        }
        
        //pageIndicator.currentPage = indexPath.row
        
        //НЕ ПРАЦЮЄ - вивидоть 0, потім одразу 1,2, далі нормально - ???
        //довелось використовувати - scrollViewDidEndDecelerating
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//
//        //let scrollPosition = scrollView.contentOffset.x / scrollView.bounds.width
//
//        let scrollPosition = scrollView.contentOffset.y / scrollView.bounds.height
//
//        let currentPosition = scrollPosition.isNaN ? 0 : Int(round(scrollPosition))
//
//        debugPrint("currentPosition - \(currentPosition)")
//    }
    
    /*
     // MARK: - UIPageControl
     func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         //print("\(indexPath.row)")
         //pageIndicator.currentPage = indexPath.row
         
         //НЕ ПРАЦЮЄ - вивидоть 0, потім одразу 1,2, далі нормально - ???
         //довелось використовувати - scrollViewDidEndDecelerating
     }
     
     func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         let scrollPosition = scrollView.contentOffset.x / view.frame.width
         pageIndicator.currentPage = Int( round(scrollPosition) )
     }
     */
}

// MARK: UICollectionViewDelegateFlowLayout
extension NewsView: UICollectionViewDelegateFlowLayout {
    
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

