//
//  ImageDataCreator.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class ImageDataCreator {
    
    func createImageDataObjects(from imagesResult: [ImagesResult]) -> [ImageData]? {
        var imagesData = [ImageData]()
        
        for imageResult in imagesResult {
            guard let imageData = ImageData(imageResult: imageResult) else { return nil }
            imagesData.append(imageData)
        }
        return imagesData
    }
}
