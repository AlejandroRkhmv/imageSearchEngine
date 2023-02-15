//
//  MainPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class MainPresenter: IMainPresenter {
    
    weak var mainViewController: IMainViewController?
    var mainInteractor: IMainInteractor
    var imagesData = [ImageData]()
    var datasForImages = [Data]()
    
    required init(mainViewController: IMainViewController?, mainInteractor: IMainInteractor) {
        self.mainViewController = mainViewController
        self.mainInteractor = mainInteractor
    }
    
    func userEnterRequestAndPressSearch(request: String) {
        mainInteractor.createImageDatasArray(request: request) { [weak self] imagesData in
            guard let self = self else { return }
            self.imagesData = imagesData
        } completionHandlerForData: { [weak self] datasForImages in
            guard let self = self else { return }
            self.datasForImages = datasForImages
        }
        mainViewController?.reloadData()
    }
}
