//
//  NetworkService.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class NetworkService: INetworkService {
    
    let jsonParser = JsonParser()
    let imageDataCreator = ImageDataCreator()
    
    func loadImagesData(from url: URL, completionHandler: @escaping (([ImageData]) -> Void)) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription, "1")
            }
            if let data = data {
//                guard let stringData = String(data: data, encoding: .utf8) else { return }
//                print(stringData)
                guard let imagesResult = self.jsonParser.parseJSON(with: data) else { return }
                guard let imagesData = self.imageDataCreator.createImageDataObjects(from: imagesResult.imagesResults) else { return }
                completionHandler(imagesData)
            }
        }
        task.resume()
    }
    
    func loadDataImageForSingleData(from url: URL, completionData: @escaping ((Data) -> Void)) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(String(describing: error))
            }
            if let data = data {
                completionData(data)
            }
        }
        task.resume()
    }
}
