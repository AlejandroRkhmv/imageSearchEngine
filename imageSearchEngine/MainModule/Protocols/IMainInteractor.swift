//
//  IMainInteractor.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

protocol IMainInteractor: AnyObject {
    var networkService: INetworkService { get set }
    
    init(networkService: INetworkService)
    
    func createImageDatasArray(request: String, completionHandler: @escaping (([ImageData]) -> Void), completionHandlerForData: @escaping (([Data]) -> Void))
}
