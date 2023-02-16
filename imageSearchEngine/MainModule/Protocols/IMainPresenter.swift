//
//  IMainPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

protocol IMainPresenter: AnyObject {
    
    var mainViewController: IMainViewController? { get set }
    var mainInteractor: IMainInteractor { get set }
    
    var imagesData: [ImageData] { get set }
    
    init(mainViewController: IMainViewController?, mainInteractor: IMainInteractor)
    
    func userEnterRequestAndPressSearch(request: String)
}
