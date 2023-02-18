//
//  IBuilder.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

protocol IBuilder {
    func createMainViewController(router: IRouter) -> UIViewController
    func createImagePresentViewController(router: IRouter, indexTappedImage: Int) -> UIViewController
    func createWebViewController(router: IRouter, webUrl: String) -> UIViewController
}
