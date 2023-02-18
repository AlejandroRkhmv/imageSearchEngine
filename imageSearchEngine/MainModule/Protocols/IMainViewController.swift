//
//  IMainViewController.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

protocol IMainViewController: AnyObject {
    var activityIndicator: UIActivityIndicatorView { get set }
    
    func reloadData()
}
