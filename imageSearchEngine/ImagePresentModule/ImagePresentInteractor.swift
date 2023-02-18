//
//  ImagePresentInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class ImagePresentInteractor: IImagePresentInteractor {
    
    var networkService: INetworkService
    var imagesData = [ImageData]()
    
    required init(networkService: INetworkService) {
        self.networkService = networkService
    }
    
    func getImageForUser(index: Int) -> UIImage {
        var forReturnimage = UIImage()
        let urlString = imagesData[index].imageUrl
        networkService.loadImage(from: urlString) { image in
            forReturnimage = image
        }
            return forReturnimage
    }
}


