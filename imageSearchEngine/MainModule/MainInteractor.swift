//
//  MainInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class MainInteractor: IMainInteractor {
    
    var networkService: INetworkService
    
    required init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    func createImageDatasArray(request: String, completionHandler: @escaping (([ImageData]) -> Void), completionHandlerForData: @escaping (([Data]) -> Void)) {
        let urlString = "https://serpapi.com/playground?q=\(request)&tbm=isch&ijn=0"
        guard let url = URL(string: urlString) else { return }
        networkService.loadImagesData(from: url, completionHandler: { [weak self] datas in
            completionHandler(datas)
            guard let self = self else { return }
            self.createDatasForImages(imagesData: datas, completionHandlerForData: completionHandlerForData)
        })
    }
    
    private func createDatasForImages(imagesData: [ImageData], completionHandlerForData: @escaping (([Data]) -> Void)) {
        var datasForImages = [Data]()
        
        for imageData in imagesData {
            guard let url = URL(string: imageData.imageUrl) else { return }
            networkService.loadDataImageForSingleData(from: url) {data in
                datasForImages.append(data)
                completionHandlerForData(datasForImages)
            }
        }
    }
}
