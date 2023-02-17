//
//  Router.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class MainRouter: IRouter {
    
    let builder: IBuilder?
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController, builder: IBuilder) {
        self.navigationController = navigationController
        self.builder = builder
    }
    
    func initViewController() {
        if let navigationController = navigationController {
            guard let mainVC = builder?.createMainViewController(router: self) else { return }
            navigationController.viewControllers = [mainVC]
        }
    }
    
    func pushImagePresentViewController(imagesData: [ImageData], indexTappedImage: Int) {
        if let navigationController = navigationController {
            guard let imagePresentVC = builder?.createImagePresentViewController(router: self, imagesData: imagesData, indexTappedImage: indexTappedImage) else { return }
            navigationController.pushViewController(imagePresentVC, animated: false)
        }
    }
    
    func pushWebViewController(webUrl: String) {
        if let navigationController = navigationController {
            guard let webVC = builder?.createWebViewController(router: self, webUrl: webUrl) else { return }
            navigationController.pushViewController(webVC, animated: false)
        }
    }
    
    func popViewController() {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: false)
        }
    }
}
