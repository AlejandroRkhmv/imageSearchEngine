//
//  WebViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var imageWebView = WKWebView()
    let toolBar = UIToolbar()
    var backButton = UIButton()
    var webPresenter: IWebPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webPresenter?.webViewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createWebView()
        createToolBar()
        createBackButton()
        customBackButton()
    }
}
