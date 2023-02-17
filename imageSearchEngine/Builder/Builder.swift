//
//  Builder.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class Builder: IBuilder {
    
    func createMainViewController(router: IRouter) -> UIViewController {
        let mainViewController = MainViewController()
        let networkService = NetworkService()
        let mainInteractor = MainInteractor(networkService: networkService)
        let mainPresenter = MainPresenter(mainViewController: mainViewController, mainInteractor: mainInteractor, router: router)
        mainViewController.mainPresenter = mainPresenter
        return mainViewController
    }
    
    func createImagePresentViewController(router: IRouter, imagesData: [ImageData], indexTappedImage: Int) -> UIViewController {
        let imagePresentViewController = ImagePresentViewController()
        let imagePresentInteractor = ImagePresentInteractor()
        let imagePresentPresenter = ImagePresentPresenter(imagePresentViewController: imagePresentViewController, imagePresentInteractor: imagePresentInteractor, router: router, imagesData: imagesData, indexTappedImage: indexTappedImage)
        imagePresentViewController.imagePresentPresenter = imagePresentPresenter
        return imagePresentViewController
    }
    
    func createWebViewController(router: IRouter, webUrl: String) -> UIViewController {
        
    }
}
