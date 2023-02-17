//
//  WebPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class WebPresenter: IWebPresenter {
    
    weak var webViewController: IWebViewController?
    var router: IRouter
    var imageUrlString: String
    
    required init(webViewController: IWebViewController, imageUrlString: String, router: IRouter) {
        self.imageUrlString = imageUrlString
        self.webViewController = webViewController
        self.router = router
    }
    
    func webViewDidLoad() {
        webViewController?.showMe(urlString: imageUrlString)
    }
}
