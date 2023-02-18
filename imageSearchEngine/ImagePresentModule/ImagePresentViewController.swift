//
//  ImagePresentViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class ImagePresentViewController: UIViewController {

    let chooseImageView = UIImageView()
    let prevButton = UIButton()
    let nextButton = UIButton()
    let goToWebButton = UIButton()
    var imagePresentPresenter: IImagePresentPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBackButton()
        imagePresentPresenter?.showTappedImage()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createChooseImageView()
        createPrevButton()
        createNextButton()
        createGoToWebButton()
        addTargetForPrevButton()
        addTargetForNextButton()
        addTargetForGoToWebButton()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reloadElements()
    }
    
    deinit {
        print("IMAGE")
    }
}
