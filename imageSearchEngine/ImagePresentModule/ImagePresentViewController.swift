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
    var mockView = UIView()
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
        mockView = createMock()
    }
    
    // MARK: - function before change device orientation
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        switch UIDevice.current.orientation {
        case .portrait:
            mockView.isHidden = true
            self.navigationItem.leftBarButtonItem?.isHidden = false
        case .landscapeLeft:
            mockView.isHidden = false
            self.navigationItem.leftBarButtonItem?.isHidden = true
        case .landscapeRight:
            mockView.isHidden = false
            self.navigationItem.leftBarButtonItem?.isHidden = true
        default: break
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reloadElements()
    }
}
