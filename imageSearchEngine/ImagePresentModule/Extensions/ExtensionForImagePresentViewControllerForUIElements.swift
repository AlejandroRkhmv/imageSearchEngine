//
//  ExtensionForImagePresentViewControllerForUIElements.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 17.02.2023.
//

import Foundation
import UIKit

extension ImagePresentViewController {
    
    // MARK: - createChooseImageView
    func createChooseImageView() {
        makeChooseImageView()
        setConstraintsForChooseImageView()
    }
    
    private func makeChooseImageView() {
        chooseImageView.translatesAutoresizingMaskIntoConstraints = false
        chooseImageView.contentMode = .scaleAspectFit
        view.addSubview(chooseImageView)
    }
    
    private func setConstraintsForChooseImageView() {
        guard let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.size.height else { return }
        guard let navigationBarHeight = navigationController?.navigationBar.bounds.size.height else { return }
        let topBarHeight = statusBarHeight + navigationBarHeight
        
        chooseImageView.widthAnchor.constraint(equalToConstant: view.bounds.size.width - 40).isActive = true
        chooseImageView.heightAnchor.constraint(equalToConstant: view.bounds.size.height * 0.7).isActive = true
        chooseImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        chooseImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: topBarHeight).isActive = true
    }
    
    // MARK: - createPrevButton
    func createPrevButton() {
        makePrevButton()
        setConstraintsForPrevButton()
    }
    
    private func makePrevButton() {
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.setTitle("Prev", for: .normal)
        prevButton.setTitleColor(.white, for: .normal)
        prevButton.setTitleColor(.darkGray, for: .highlighted)
        prevButton.backgroundColor = .black
        prevButton.layer.cornerRadius = 10
        view.addSubview(prevButton)
    }
    
    private func setConstraintsForPrevButton() {
        prevButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        prevButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        prevButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        prevButton.topAnchor.constraint(equalTo: chooseImageView.bottomAnchor, constant: 20).isActive = true
    }
    
    func addTargetForPrevButton() {
        prevButton.addTarget(self, action: #selector(prevButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func prevButtonTapped() {
        imagePresentPresenter?.userTappedPrevButton()
    }
    
    // MARK: - createNextButton
    func createNextButton() {
        makeNextButton()
        setConstraintsForNextButton()
    }
    
    private func makeNextButton() {
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.white, for: .normal)
        nextButton.setTitleColor(.darkGray, for: .highlighted)
        nextButton.backgroundColor = .black
        nextButton.layer.cornerRadius = 10
        view.addSubview(nextButton)
    }
    
    private func setConstraintsForNextButton() {
        nextButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        view.trailingAnchor.constraint(equalTo: nextButton.trailingAnchor, constant: 20).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: prevButton.centerYAnchor, constant: 0).isActive = true
    }
    
    func addTargetForNextButton() {
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func nextButtonTapped() {
        imagePresentPresenter?.userTappedNextButton()
    }
    
    // MARK: - createGoToWebButton
    func createGoToWebButton() {
        makeGoToWebButton()
        setConstraintsForGoToWebButton()
    }
    
    private func makeGoToWebButton() {
        goToWebButton.translatesAutoresizingMaskIntoConstraints = false
        goToWebButton.setTitle("Go to web", for: .normal)
        goToWebButton.setTitleColor(.white, for: .normal)
        goToWebButton.setTitleColor(.darkGray, for: .highlighted)
        goToWebButton.backgroundColor = .black
        goToWebButton.layer.cornerRadius = 10
        view.addSubview(goToWebButton)
    }
    
    private func setConstraintsForGoToWebButton() {
        goToWebButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 90).isActive = true
        goToWebButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        goToWebButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        view.trailingAnchor.constraint(equalTo: goToWebButton.trailingAnchor, constant: 20).isActive = true
        goToWebButton.topAnchor.constraint(equalTo: prevButton.bottomAnchor, constant: 20).isActive = true
    }
    
    func addTargetForGoToWebButton() {
        goToWebButton.addTarget(self, action: #selector(goToWebButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func goToWebButtonTapped() {
        imagePresentPresenter?.userTappedGoToWebButton()
    }
    
    // MARK: - customBackButton
    func customBackButton() {
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Go back", style: .plain, target: self, action: #selector(pop))
        newBackButton.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItem = newBackButton
    }

    @objc
    private func pop() {
        imagePresentPresenter!.router.popViewController()
    }
    
    // MARK: - reloadElements
    func reloadElements() {
        chooseImageView.removeFromSuperview()
        prevButton.removeFromSuperview()
        nextButton.removeFromSuperview()
        goToWebButton.removeFromSuperview()
    }
}

// MARK: - IImagePresentViewController
extension ImagePresentViewController: IImagePresentViewController {
    func setImage(image: UIImage) {
        chooseImageView.image = image
    }
}
