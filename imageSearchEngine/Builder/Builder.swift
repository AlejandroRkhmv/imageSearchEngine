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
    
    func createImagePresentViewController(router: IRouter, indexTappedImage: Int) -> UIViewController {
        let imagePresentViewController = ImagePresentViewController()
        let networkService = NetworkService()
        let imagePresentInteractor = ImagePresentInteractor(networkService: networkService)
        let imagePresentPresenter = ImagePresentPresenter(imagePresentViewController: imagePresentViewController, imagePresentInteractor: imagePresentInteractor, router: router, indexTappedImage: indexTappedImage)
        imagePresentViewController.imagePresentPresenter = imagePresentPresenter
        return imagePresentViewController
    }
    
    func createWebViewController(router: IRouter, webUrl: String) -> UIViewController {
        let webViewController = WebViewController()
        let webPresenter = WebPresenter(webViewController: webViewController, imageUrlString: webUrl, router: router)
        webViewController.webPresenter = webPresenter
        return webViewController
    }
}
