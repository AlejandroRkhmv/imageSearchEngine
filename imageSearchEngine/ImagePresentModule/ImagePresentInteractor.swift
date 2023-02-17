//
//  ImagePresentInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class ImagePresentInteractor: IImagePresentInteractor {
    
    var imagesData = [ImageData]()
    
    func getImageForUser(index: Int) -> UIImage {
        let urlString = imagesData[index].imageUrl
        guard let url = URL(string: urlString) else { return UIImage() }
        guard let data = try? Data(contentsOf: url) else { return UIImage() }
        guard let image = UIImage(data: data) else { return UIImage() }
        return image
    }
}
