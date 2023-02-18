//
//  MainPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class MainPresenter: IMainPresenter {
    
    weak var mainViewController: IMainViewController?
    var mainInteractor: IMainInteractor
    var router: IRouter
        
    required init(mainViewController: IMainViewController?, mainInteractor: IMainInteractor, router: IRouter) {
        self.mainViewController = mainViewController
        self.mainInteractor = mainInteractor
        self.router = router
    }
    
    
    func userEnterRequestAndPressSearch(request: String) {
        mainInteractor.clearCache()
        mainInteractor.clearStorageImagesData()
        DispatchQueue.main.async {
            self.mainViewController?.reloadData()
        }
        
        mainInteractor.createImageDatasArray(request: request) { [weak self] imagesData in
            guard let self = self else { return }
            Storage.imagesData = imagesData
            DispatchQueue.main.async {
                self.mainViewController?.reloadData()
                self.mainViewController?.activityIndicator.stopAnimating()
            }
        }
    }
    
    func userTappedOnImage(key: Int) {
        router.pushImagePresentViewController(indexTappedImage: key)
    }
    
    func loadImageForCell(from urlString: String, completionImage: @escaping ((UIImage) -> Void)) {
        mainInteractor.loadImageForCell(from: urlString, completionImage: completionImage)
    }
    
    func getCountOfImages(completionForCount: @escaping ((Int) -> Void)) {
        mainInteractor.getCountOfImages(completionForCount: completionForCount)
    }
    
    func getImageUrl(for i: Int, completionForImageUrl: @escaping ((String) -> Void)) {
        mainInteractor.getImageUrl(for: i, completionForImageUrl: completionForImageUrl)
    }
}
