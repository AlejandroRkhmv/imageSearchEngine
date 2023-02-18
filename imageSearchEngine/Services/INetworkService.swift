//
//  INetworkService.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

protocol INetworkService {
    func loadImagesData(from url: URL, completionHandler: @escaping (([ImageData]) -> Void))
    func loadImage(from urlString: String, completionImage: @escaping (UIImage) -> Void)
}
