//
//  MainInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class MainInteractor: IMainInteractor {
    
    let apiKey = "40590422e16d48c102c3b50bdd69374cea3c1c3a2cd90772ca75fa18706cddba"
    var networkService: INetworkService
    
    
    private let queueConcurent = DispatchQueue(label: "concurentQueue", attributes: .concurrent)
    
    required init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    
    func createImageDatasArray(request: String, completionHandler: @escaping (([ImageData]) -> Void)) {
        let urlString = "https://serpapi.com/search.json?q=\(request)&tbm=isch&ijn=0&api_key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        networkService.loadImagesData(from: url) { data in
            completionHandler(data)
        }
    }
}


