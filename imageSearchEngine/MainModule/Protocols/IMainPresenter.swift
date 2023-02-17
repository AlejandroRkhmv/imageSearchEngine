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
    var router: IRouter { get set }
    
    var imagesData: [ImageData] { get set }
    var imagesInfo: [ImageInfo] { get set }
    
    init(mainViewController: IMainViewController?, mainInteractor: IMainInteractor, router: IRouter)
    
    func userEnterRequestAndPressSearch(request: String)
    func userTappedOnImage(key: Int)
}
