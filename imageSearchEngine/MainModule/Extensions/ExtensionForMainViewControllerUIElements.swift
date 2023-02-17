//
//  ExtensionForMainViewControllerUIElements.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

// MARK: - MainViewControllerDelegate
protocol MainViewControllerDelegate {
    func sendRequestToMainPresenter(request: String)
}


// MARK: - create UI elements
extension MainViewController {
    
    func createsearchLabelView() {
        searchLabelView.frame = CGRect(x: 0, y: 75, width: view.bounds.size.width, height: 75)
        view.addSubview(searchLabelView)
        createSearchLabel()
    }
    
    func createSearchTextFieldView() {
        searchTextFieldView.frame = CGRect(x: 0, y: 150, width: view.bounds.size.width, height: 75)
        view.addSubview(searchTextFieldView)
        createSearchTextField()
        addAnimationForSearchTextField()
        createCancelButton()
    }
    
    func createRequestLabelView() {
        requestLabelView.frame = CGRect(x: 0, y: 225, width: view.bounds.size.width, height: 50)
        view.addSubview(requestLabelView)
        createRequestLabel()
    }
    
    func createSearchLabel() {
        makeSearchLabel()
        setConstraintsForSearchLabel()
    }

    func createSearchTextField() {
        makeSearchTextField()
        setConstraintsForSearchTextField()
    }

    func createCancelButton() {
        makeCancelButton()
        setConstraintsForCancelButton()
    }

    func createRequestLabel() {
        makeRequestLabel()
        setConstraintsForRequestLabel()
    }

    // MARK: - createImagesCollectionView
    func createImagesCollectionView() {
        let layout = UICollectionViewFlowLayout()
        imagesCollectionView = UICollectionView(frame: CGRect(x: 20, y: 300, width: view.bounds.size.width - 40, height: view.bounds.size.height - 200), collectionViewLayout: layout)
        imagesCollectionView?.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        guard let collectionView = imagesCollectionView else { return }
        imagesCollectionView?.delegate = self
        imagesCollectionView?.dataSource = self
        view.addSubview(collectionView)
    }
    
    // MARK: - makeSearchLabel
    private func makeSearchLabel() {
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.text = "Search images"
        searchLabel.font = UIFont(name: "Courier", size: 30)
        searchLabel.textColor = .black
        searchLabelView.addSubview(searchLabel)
    }

    private func setConstraintsForSearchLabel() {
        searchLabel.widthAnchor.constraint(equalToConstant: searchLabelView.bounds.size.width - 40).isActive = true
        searchLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchLabel.leadingAnchor.constraint(equalTo: searchLabelView.leadingAnchor, constant: 20).isActive = true
        searchLabel.centerYAnchor.constraint(equalTo: searchLabelView.centerYAnchor, constant: 0).isActive = true
    }

    // MARK: - makeSearchTextField
    private func makeSearchTextField() {
        searchTextField.delegate = self
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.borderStyle = .roundedRect
        addMagnifyingGlassImage(on: searchTextField)
        addClearMode(on: searchTextField)
        searchTextField.placeholder = "Enter your request"
        searchTextField.layer.borderWidth = 1.0
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.cornerRadius = 10
        searchTextField.returnKeyType = UIReturnKeyType.search
        searchTextFieldView.addSubview(searchTextField)
    }

    private func setConstraintsForSearchTextField() {
        searchTextField.widthAnchor.constraint(equalToConstant: searchTextFieldView.bounds.size.width - 40).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextField.leadingAnchor.constraint(equalTo: searchTextFieldView.leadingAnchor, constant: 20).isActive = true
        searchTextField.centerYAnchor.constraint(equalTo: searchTextFieldView.centerYAnchor, constant: 0).isActive = true
    }

    internal func addMagnifyingGlassImage(on textField: UITextField) {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        let magnifyingGlassImage = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        imageView.image = magnifyingGlassImage
        imageView.contentMode = .scaleAspectFit
        textField.leftViewMode = .always
        textField.leftView = imageView
    }

    internal func addClearMode(on textField: UITextField) {
        let clear = UIButton()
        clear.setTitle("x.circle.fill", for: .normal)
        textField.clearButtonMode = .whileEditing
        textField.rightView = clear
    }

    // MARK: - tap on searchTextField
    internal func addAnimationForSearchTextField() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [self] (nc) in
            self.searchTextField.becomeFirstResponder()
            self.searchLabelView.isHidden = true
            self.searchLabelView.frame.origin.y = 0
            self.searchTextFieldView.frame.origin.y = 75
            self.requestLabelView.frame.origin.y = 150
            self.imagesCollectionView?.frame.origin.y = 225
            self.searchTextField.frame.size.width = searchTextFieldView.bounds.size.width - 240
            self.cancelButton.isHidden = false
        }
    }

    // MARK: - makeCancelButton
    private func makeCancelButton() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.isHidden = true
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.white, for: .normal)
        cancelButton.setTitleColor(.darkGray, for: .highlighted)
        cancelButton.backgroundColor = .black
        cancelButton.layer.cornerRadius = 10
        searchTextFieldView.addSubview(cancelButton)
    }

    private func setConstraintsForCancelButton() {
        cancelButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextFieldView.trailingAnchor.constraint(equalTo: cancelButton.trailingAnchor, constant: 20).isActive = true
        cancelButton.centerYAnchor.constraint(equalTo: searchTextFieldView.centerYAnchor, constant: 0).isActive = true
    }

    // MARK: - add target for cancel button
    func cancelButtonTarget() {
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }

    // MARK: - cancelButtonTapped
    @objc
    private func cancelButtonTapped() {
        self.searchTextField.resignFirstResponder()
        self.searchLabelView.isHidden = false
        self.searchLabelView.frame.origin.y = 75
        self.searchTextFieldView.frame.origin.y = 150
        self.requestLabelView.frame.origin.y = 225
        self.imagesCollectionView?.frame.origin.y = 300
        self.cancelButton.isHidden = true
        self.searchTextField.frame.size.width += 100
        self.searchTextField.text = ""
    }

    // MARK: - makeRequestLabel
    private func makeRequestLabel() {
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.font = UIFont(name: "Courier", size: 30)
        requestLabel.textColor = .black
        requestLabel.textAlignment = .center
        requestLabel.isHidden = true
        requestLabelView.addSubview(requestLabel)
    }

    private func setConstraintsForRequestLabel() {
        requestLabel.widthAnchor.constraint(equalToConstant: requestLabelView.bounds.size.width - 40).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        requestLabel.centerXAnchor.constraint(equalTo: requestLabelView.centerXAnchor, constant: 0).isActive = true
        requestLabel.centerYAnchor.constraint(equalTo: requestLabelView.centerYAnchor, constant: 0).isActive = true
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchTextField {
            guard let requestText = textField.text?.trimmingCharacters(in: .whitespaces) else { return false }
            sendRequestToMainPresenter(request: requestText)
            requestLabel.text = requestText
            requestLabel.isHidden = false
            searchTextField.resignFirstResponder()
            return true
        }
        return false
    }
}
