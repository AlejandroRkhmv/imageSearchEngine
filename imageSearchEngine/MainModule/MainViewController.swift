//
//  ViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var startOrientation: Bool?

    var leadingConstraint: NSLayoutConstraint!
    var trailingConstraint: NSLayoutConstraint!
    let layout = UICollectionViewFlowLayout()
    let searchLabelView = UIView()
    let searchLabel = UILabel()
    let requestLabelView = UIView()
    let searchTextFieldView = UIView()
    let searchTextField = UITextField()
    let cancelButton = UIButton()
    let requestLabel = UILabel()
    var imagesCollectionView: UICollectionView?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    var mockView = UIView()
    var mainPresenter: IMainPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        createsearchLabelView()
        createSearchTextFieldView()
        createRequestLabelView()
        createImagesCollectionView()
        cancelButtonTarget()
        makeActivityIndicator()
        mockView = createMock()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reloadElements()
    }
    
    // MARK: - function before change device orientation
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        switch UIDevice.current.orientation {
        case .portrait:
            mockView.isHidden = true
        case .landscapeLeft:
            mockView.isHidden = false
        case .landscapeRight:
            mockView.isHidden = false
        default: break
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        dismiss(animated: false)
        view.removeFromSuperview()
    }
}

