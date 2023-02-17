//
//  ImagePresentPresenter.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class ImagePresentPresenter: IImagePresentPresenter {
    
    weak var imagePresentViewController: IImagePresentViewController?
    var imagePresentInteractor: IImagePresentInteractor
    var router: IRouter
    var imagesData: [ImageData]
    var indexTappedImage: Int
    
    required init(imagePresentViewController: IImagePresentViewController, imagePresentInteractor: IImagePresentInteractor, router: IRouter, imagesData: [ImageData], indexTappedImage: Int) {
        self.imagePresentViewController = imagePresentViewController
        self.imagePresentInteractor = imagePresentInteractor
        self.router = router
        self.imagesData = imagesData
        self.indexTappedImage = indexTappedImage
        imagePresentInteractor.imagesData = imagesData
    }
    
    func showTappedImage() {
        DispatchQueue.global().async {
            let image = self.imagePresentInteractor.getImageForUser(index: self.indexTappedImage)
            DispatchQueue.main.async {
                self.imagePresentViewController?.setImage(image: image)
            }
        }
    }
    
    func userTappedPrevButton() {
        guard indexTappedImage > 0 else { return }
        indexTappedImage -= 1
        DispatchQueue.global().async {
            let image = self.imagePresentInteractor.getImageForUser(index: self.indexTappedImage)
            DispatchQueue.main.async {
                self.imagePresentViewController?.setImage(image: image)
            }
        }
    }
    
    func userTappedNextButton() {
        guard indexTappedImage < imagesData.count - 1 else { return }
        indexTappedImage += 1
        DispatchQueue.global().async {
            let image = self.imagePresentInteractor.getImageForUser(index: self.indexTappedImage)
            DispatchQueue.main.async {
                self.imagePresentViewController?.setImage(image: image)
            }
        }
    }
    
    func userTappedGoToWebButton() {
        
    }
}
