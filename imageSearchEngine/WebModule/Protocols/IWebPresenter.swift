//
//  IWebPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 17.02.2023.
//

import Foundation

protocol IWebPresenter: AnyObject {
    
    var webViewController: IWebViewController? { get set }
    var router: IRouter { get set }
    var imageUrlString: String { get set }
    
    init(webViewController: IWebViewController, imageUrlString: String, router: IRouter)
    
    func webViewDidLoad()
}
