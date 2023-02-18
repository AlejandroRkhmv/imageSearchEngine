//
//  IImagePresentInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 17.02.2023.
//

import UIKit

protocol IImagePresentInteractor: AnyObject {
    
    var imagesData: [ImageData] { get set }
    var networkService: INetworkService { get set }
    
    init(networkService: INetworkService)
    
    func getImageForUser(index: Int) -> UIImage
}
