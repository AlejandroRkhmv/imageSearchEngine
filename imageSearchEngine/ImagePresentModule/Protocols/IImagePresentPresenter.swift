//
//  IImagePresentPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 17.02.2023.
//

import Foundation

protocol IImagePresentPresenter: AnyObject {
    
    var imagePresentViewController: IImagePresentViewController? { get set }
    var imagePresentInteractor: IImagePresentInteractor { get set }
    var router: IRouter { get set }
    var indexTappedImage: Int { get set }
    
    init(imagePresentViewController: IImagePresentViewController, imagePresentInteractor: IImagePresentInteractor, router: IRouter, indexTappedImage: Int)
    
    func showTappedImage()
    func userTappedPrevButton()
    func userTappedNextButton()
    func userTappedGoToWebButton()
}
