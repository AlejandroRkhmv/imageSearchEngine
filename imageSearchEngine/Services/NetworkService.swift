//
//  NetworkService.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

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
    
    func loadImage(from urlString: String, completionImage: @escaping (UIImage) -> Void) {
        if let image = Catche.cache.object(forKey: urlString as AnyObject) {
            completionImage(image)
        } else {
            guard let url = URL(string: urlString) else { return }
            guard let data = try? Data(contentsOf: url) else { return }
            guard let image = UIImage(data: data) else { return }
            completionImage(image)
        }
    }
}
