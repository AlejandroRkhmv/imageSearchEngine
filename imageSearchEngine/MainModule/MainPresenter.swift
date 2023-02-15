//
//  MainPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class MainPresenter {
    
    var mainInteractor: IMainInteractor
    var imagesData = [ImageData]()
    var datasForImages = [Data]()
    
    init(mainInteractor: IMainInteractor) {
        self.mainInteractor = mainInteractor
    }
    
    func userEnterRequestAndPressSearch(urlString: String, completionHandler: @escaping (([ImageData]) -> Void)) {
        mainInteractor.createImageDatasArray(urlString: urlString) { [weak self] imagesData in
            guard let self = self else { return }
            self.imagesData = imagesData
        }
    }
    
    func fillDatasForImages() {
        mainInteractor.completionHandlerForData = { [weak self] datas in
            guard let self = self else { return }
            self.datasForImages = datas
        }
    }
}
