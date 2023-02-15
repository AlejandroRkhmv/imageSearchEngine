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
        mainView?.imagesCollectionView?.delegate = self
        mainView?.imagesCollectionView?.dataSource = self
        guard let mainView = mainView else { return }
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
    }
    
    private func setConstraintsForMainView() {
        let topbarHeight: CGFloat = (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 010.0) + (self.navigationController?.navigationBar.frame.height ?? 100.0)
        
        mainView?.widthAnchor.constraint(equalToConstant: self.view.bounds.size.width).isActive = true
        mainView?.heightAnchor.constraint(equalToConstant: (self.view.bounds.size.height - topbarHeight)).isActive = true
        mainView?.topAnchor.constraint(equalTo: self.view.topAnchor, constant: topbarHeight).isActive = true
        mainView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }
}

// MARK: - IMainViewController
extension MainViewController: IMainViewController {
    func reloadData() {
        mainView?.imagesCollectionView?.reloadData()
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let countOfImages = mainPresenter?.datasForImages.count else { return 0 }
        return countOfImages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell {
            guard let dataForImage = mainPresenter?.datasForImages[indexPath.row] else { return UICollectionViewCell() }
            cell.dataForImage = dataForImage
            return cell
        }
        
        
        return UICollectionViewCell()
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.width / 3, height: collectionView.bounds.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 1
    }
    
}

// MARK: - MainViewControllerDelegate

extension MainViewController: MainViewControllerDelegate {
    func sendRequestToMainPresenter(request: String) {
        mainPresenter?.userEnterRequestAndPressSearch(request: request)
    }
}
