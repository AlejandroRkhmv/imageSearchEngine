//
//  MainPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class MainPresenter: IMainPresenter {
    
    weak var mainViewController: IMainViewController?
    var mainInteractor: IMainInteractor
    var router: IRouter
    
    var imagesData = [ImageData]()
    var imagesInfo = [ImageInfo]()
        
    required init(mainViewController: IMainViewController?, mainInteractor: IMainInteractor, router: IRouter) {
        self.mainViewController = mainViewController
        self.mainInteractor = mainInteractor
        self.router = router
    }
    
    
    func userEnterRequestAndPressSearch(request: String) {
        mainInteractor.createImageDatasArray(request: request) { [weak self] imagesData in
            guard let self = self else { return }
            self.imagesData = imagesData
            
            DispatchQueue.main.async {
                self.mainViewController?.reloadData()
                self.mainViewController?.activityIndicator.stopAnimating()
            }
        }
    }
    
    func userTappedOnImage(key: Int) {
        router.pushImagePresentViewController(imagesData: imagesData, indexTappedImage: key)
    }
}
