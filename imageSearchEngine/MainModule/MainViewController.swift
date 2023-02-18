//
//  ViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class MainViewController: UIViewController {

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
    }
}

