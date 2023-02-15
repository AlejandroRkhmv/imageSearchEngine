//
//  Builder.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class Builder {
    
    func createMainViewController() -> UIViewController {
        let mainViewController = MainViewController()
        let networkService = NetworkService()
        let mainInteractor = MainInteractor(networkService: networkService)
        let mainPresenter = MainPresenter(mainViewController: mainViewController, mainInteractor: mainInteractor)
        mainViewController.mainPresenter = mainPresenter
        return mainViewController
    }
}
