//
//  ExtensionForMainViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation
import UIKit

extension MainViewController {
    
    // MARK: - createMainView
    func createMainView() {
        makeMainView()
        setConstraintsForMainView()
    }
    
    private func makeMainView() {
        mainView = MainView()
        mainView?.delegate = self
        mainView?.imagesCollectionView?.collectionView.delegate = self
        mainView?.imagesCollectionView?.collectionView.dataSource = self
        guard let mainView = mainView else { return }
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
    }
    
    private func setConstraintsForMainView() {
        let topbarHeight: CGFloat = (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 100.0) + (self.navigationController?.navigationBar.frame.height ?? 100.0)
        
        mainView?.widthAnchor.constraint(equalToConstant: self.view.bounds.size.width).isActive = true
        mainView?.heightAnchor.constraint(equalToConstant: (self.view.bounds.size.height - topbarHeight)).isActive = true
        mainView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: topbarHeight).isActive = true
        mainView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }
}

// MARK: - IMainViewController
extension MainViewController: IMainViewController {
    func reloadData() {
        mainView?.imagesCollectionView?.collectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let countOfImages = mainPresenter?.imagesData.count else { return 0 }
        print(countOfImages)
        return countOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell {
            guard let urlForImage = mainPresenter?.imagesData[indexPath.row].imageUrl else { return UICollectionViewCell() }
            cell.urlForImage = urlForImage
            return cell
        }
        
        
        return UICollectionViewCell()
    }
}

extension MainView: UICollectionViewDelegateFlowLayout {
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            return CGSize(width: ((collectionView.bounds.size.width - 10) / 2), height: (collectionView.bounds.size.height / 2))
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            
            return 10
        }
    
}

// MARK: - MainViewControllerDelegate

extension MainViewController: MainViewControllerDelegate {
    func sendRequestToMainPresenter(request: String) {
        mainPresenter?.userEnterRequestAndPressSearch(request: request)
    }
}


