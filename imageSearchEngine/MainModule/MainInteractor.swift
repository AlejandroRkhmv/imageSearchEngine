//
//  MainInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class MainInteractor: IMainInteractor {
    
    var networkService: INetworkService
    var imagesData = [ImageData]() {
        didSet {
            createDatasForImages(imagesData: imagesData)
        }
    }
    var completionHandlerForData: (([Data]) -> Void)?
    
    required init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    func createImageDatasArray(urlString: String, completionHandler: @escaping (([ImageData]) -> Void)) {
        guard let url = URL(string: urlString) else { return }
        networkService.loadImagesData(from: url, completionHandler: { [weak self] datas in
            guard let self = self else { return }
            self.imagesData = datas
            completionHandler(datas)
        })
    }
    
    private func createDatasForImages(imagesData: [ImageData]) {
        var datasForImages = [Data]()
        
        for imageData in imagesData {
            guard let url = URL(string: imageData.imageUrl) else { return }
            networkService.loadDataImageForSingleData(from: url) { [weak self] data in
                guard let self = self else { return }
                datasForImages.append(data)
                self.completionHandlerForData?(datasForImages)
            }
        }
    }
}
