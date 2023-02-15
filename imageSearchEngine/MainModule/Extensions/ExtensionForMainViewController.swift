//
//  ExtensionForMainViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation
import UIKit

extension MainViewController {
    
    func createMainView() {
        makeMainView()
        setConstraintsForMainView()
    }
    
    private func makeMainView() {
        mainView = MainView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mainView)
    }
    
    private func setConstraintsForMainView() {
        let topbarHeight: CGFloat = (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 010.0) + (self.navigationController?.navigationBar.frame.height ?? 100.0)
        
        mainView.widthAnchor.constraint(equalToConstant: self.view.bounds.size.width).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: (self.view.bounds.size.height - topbarHeight)).isActive = true
        mainView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: topbarHeight).isActive = true
        mainView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
    }
}
