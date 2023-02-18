//
//  IMainPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

protocol IMainPresenter: AnyObject {
    
    var mainViewController: IMainViewController? { get set }
    var mainInteractor: IMainInteractor { get set }
    var router: IRouter { get set }
    
    init(mainViewController: IMainViewController?, mainInteractor: IMainInteractor, router: IRouter)
    
    func userEnterRequestAndPressSearch(request: String)
    func userTappedOnImage(key: Int)
    func loadImageForCell(from urlString: String, completionImage: @escaping ((UIImage) -> Void))
    func getCountOfImages(completionForCount: @escaping ((Int) -> Void))
    func getImageUrl(for i: Int, completionForImageUrl: @escaping ((String) -> Void))
}
