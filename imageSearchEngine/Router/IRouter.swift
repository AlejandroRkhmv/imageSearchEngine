//
//  IRouter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

protocol IRouterInit {
    
    func initViewController()
}

protocol IRouterPush {
    func pushImagePresentViewController(indexTappedImage: Int)
    func pushWebViewController(webUrl: String)
}

protocol IRouterPop {
    func popViewController()
}


typealias IRouter = IRouterInit & IRouterPush & IRouterPop
