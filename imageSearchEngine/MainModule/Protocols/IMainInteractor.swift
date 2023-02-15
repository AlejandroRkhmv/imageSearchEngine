//
//  IMainInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

protocol IMainInteractor: AnyObject {
    var networkService: INetworkService { get set }
    var completionHandlerForData: (([Data]) -> Void)? { get set }
    
    init(networkService: INetworkService)
    
    func createImageDatasArray(urlString: String, completionHandler: @escaping (([ImageData]) -> Void))
}
