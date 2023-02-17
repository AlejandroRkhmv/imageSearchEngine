//
//  ExtensionForWebViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 17.02.2023.
//

import UIKit
import WebKit

extension WebViewController {
    
    // MARK: - createWebView
    func createWebView() {
        makeWKWebView()
        setConstraintsForWebViewController()
    }
    
    private func makeWKWebView() {
        imageWebView.translatesAutoresizingMaskIntoConstraints = false
        imageWebView.uiDelegate = self
        imageWebView.navigationDelegate = self
        self.view.addSubview(imageWebView)
    }
    
    private func setConstraintsForWebViewController() {
        imageWebView.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        imageWebView.heightAnchor.constraint(equalToConstant: view.bounds.size.height).isActive = true
        imageWebView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        imageWebView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
    }
    
    // MARK: - createToolBar
    func createToolBar() {
        makeToolBar()
        setConstraintsForToolBar()
    }
    
    private func makeToolBar() {
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        toolBar.backgroundColor = .black
        self.view.addSubview(toolBar)
    }
    
    private func setConstraintsForToolBar() {
        toolBar.widthAnchor.constraint(equalToConstant: view.bounds.size.width).isActive = true
        toolBar.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.121).isActive = true
        toolBar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        view.bottomAnchor.constraint(equalTo: toolBar.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: - createBackButton
    func createBackButton() {
        makeBackButton()
        setConstraintsForBackButton()
        addTargetForBackButton()
    }
    
    private func makeBackButton() {
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Go to web", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.setTitleColor(.darkGray, for: .highlighted)
        backButton.backgroundColor = .black
        backButton.layer.cornerRadius = 10
        toolBar.addSubview(backButton)
    }
    
    private func setConstraintsForBackButton() {
        backButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 90).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        backButton.leadingAnchor.constraint(equalTo: toolBar.leadingAnchor, constant: 20).isActive = true
        toolBar.trailingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 20).isActive = true
        backButton.centerYAnchor.constraint(equalTo: toolBar.centerYAnchor, constant: 0).isActive = true
    }
    
    private func addTargetForBackButton() {
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc
    func goBack() {
        webPresenter?.router.popViewController()
    }
    
    // MARK: - customBackButton
    func customBackButton() {
        self.navigationItem.hidesBackButton = true
    }
}

// MARK: - IWebViewController
extension WebViewController: IWebViewController {
    func showMe(urlString: String) {
        if let url = URL(string: urlString) {
        let request = URLRequest(url: url)
        self.imageWebView.load(request)
        }
    }
}

// MARK: - WKNavigationDelegate, WKUIDelegate
extension WebViewController: WKNavigationDelegate, WKUIDelegate {
    
}
