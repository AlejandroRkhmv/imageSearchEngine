//
//  ExtensionForMainViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation
import UIKit

// MARK: - MainViewControllerDelegate
protocol MainViewControllerDelegate {
    func sendRequestToMainPresenter(request: String)
}

// MARK: - MainViewControllerCellDelegate
protocol MainViewControllerCellDelegate {
    func loadImage(from urlString: String, completionImage: @escaping ((UIImage) -> Void))
}

// MARK: - IMainViewController
extension MainViewController: IMainViewController {
    func reloadData() {
        imagesCollectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let countOfImages = Storage.imagesData.count
        return countOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell {
            cell.delegate = self
            let urlForImage = Storage.imagesData[indexPath.row].imageUrl
            cell.urlForImage = urlForImage
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainPresenter?.userTappedOnImage(key: indexPath.row)
        moveElementsToStartPosition()
        
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: ((collectionView.bounds.size.width - 10) / 3), height: ((collectionView.bounds.size.height) / 8))
        }
        
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            
            return 5
        }
}

// MARK: - MainViewControllerDelegate
extension MainViewController: MainViewControllerDelegate {
    func sendRequestToMainPresenter(request: String) {
        mainPresenter?.userEnterRequestAndPressSearch(request: request)
    }
}

extension MainViewController: MainViewControllerCellDelegate {
    func loadImage(from urlString: String, completionImage: @escaping ((UIImage) -> Void)) {
        mainPresenter?.loadImageForCell(from: urlString, completionImage: completionImage)
    }
}
