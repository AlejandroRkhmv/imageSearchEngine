//
//  IMainInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

protocol IMainInteractor: AnyObject {
    
    var networkService: INetworkService { get set }
    
    init(networkService: INetworkService)
    
    func createImageDatasArray(request: String, completionHandler: @escaping (([ImageData]) -> Void))
    func clearCatche()
    func clearStorageImagesData()
    func loadImageForCell(from urlString: String, completionImage: @escaping ((UIImage) -> Void))
}
