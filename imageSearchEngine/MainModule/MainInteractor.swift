//
//  MainInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class MainInteractor: IMainInteractor {
    
    var networkService: INetworkService
    
    private let queueConcurent = DispatchQueue(label: "concurentQueue", attributes: .concurrent)
    
    required init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    func createImageDatasArray(request: String, completionHandler: @escaping (([ImageData]) -> Void)) {
        let urlString = "https://serpapi.com/search.json?q=\(request)&tbm=isch&ijn=0&api_key=\(Storage.apiKey)"
        guard let url = URL(string: urlString) else { return }
        networkService.loadImagesData(from: url) { data in
            completionHandler(data)
        }
    }
    
    func clearCatche() {
        Cache.cache.removeAllObjects()
    }
    
    func clearStorageImagesData() {
        Storage.imagesData.removeAll()
    }
    
    func loadImageForCell(from urlString: String, completionImage: @escaping ((UIImage) -> Void)) {
        networkService.loadImage(from: urlString, completionImage: completionImage)
    }
}


