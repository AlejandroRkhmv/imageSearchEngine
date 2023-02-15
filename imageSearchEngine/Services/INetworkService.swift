//
//  INetworkService.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

protocol INetworkService {
    func loadImagesData(from url: URL, completionHandler: @escaping (([ImageData]) -> Void))
    func loadDataImageForSingleData(from url: URL, completionHandler: @escaping ((Data) -> Void))
}
