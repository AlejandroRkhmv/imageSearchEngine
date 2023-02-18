//
//  ExtensionForMainViewControllerUIElements.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

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
        guard let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.size.height else { return }
        guard let navigationBarHeight = navigationController?.navigationBar.bounds.size.height else { return }
        let topBarHeight = statusBarHeight + navigationBarHeight
        let heightSubtraction = topBarHeight + searchTextFieldView.frame.size.height + searchLabelView.frame.size.height
        
        let layout = UICollectionViewFlowLayout()
        imagesCollectionView = UICollectionView(frame: CGRect(x: 20, y: 300, width: view.bounds.size.width - 40, height: view.bounds.size.height - heightSubtraction), collectionViewLayout: layout)
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
        
        leadingConstraint = searchTextField.leadingAnchor.constraint(equalTo: searchTextFieldView.leadingAnchor, constant: 20)
        trailingConstraint = searchTextFieldView.trailingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 20)

        NSLayoutConstraint.activate([
            searchTextField.heightAnchor.constraint(equalToConstant: 44),
            searchTextField.centerYAnchor.constraint(equalTo: searchTextFieldView.centerYAnchor, constant: 0),
            leadingConstraint,
            trailingConstraint
        ])
        
        searchTextField.layoutIfNeeded()
        
    }

    internal func addMagnifyingGlassImage(on textField: UITextField) {
        let magnifyingGlassImage = UIImage(systemName: "magnifyingglass", withConfiguration: UIImage.SymbolConfiguration(weight: .medium))?.withTintColor(.gray, renderingMode: .alwaysOriginal)
        textField.setLeftIcon(magnifyingGlassImage!)
    }

    internal func addClearMode(on textField: UITextField) {
        let clear = UIButton()
        clear.setTitle("x.circle.fill", for: .normal)
        textField.clearButtonMode = .whileEditing
        textField.rightView = clear
    }

    // MARK: - tap on searchTextField
    internal func addAnimationForSearchTextField() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { [weak self] (nc) in
            guard let self = self else { return }
            self.searchTextField.becomeFirstResponder()
            self.searchLabelView.isHidden = true
            self.searchLabelView.frame.origin.y = 0
            self.searchTextFieldView.frame.origin.y = 75
            self.requestLabelView.frame.origin.y = 150
            self.imagesCollectionView?.frame.origin.y = 225
            self.trailingConstraint.constant = 120
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
        moveElementsToStartPosition()
    }
    
    func moveElementsToStartPosition() {
        self.searchTextField.resignFirstResponder()
        self.searchLabelView.isHidden = false
        self.searchLabelView.frame.origin.y = 75
        self.searchTextFieldView.frame.origin.y = 150
        self.requestLabelView.frame.origin.y = 225
        self.imagesCollectionView?.frame.origin.y = 300
        self.cancelButton.isHidden = true
        self.trailingConstraint.constant = 20
        self.searchTextField.text = ""
    }

    // MARK: - makeRequestLabel
    private func makeRequestLabel() {
        requestLabel.translatesAutoresizingMaskIntoConstraints = false
        requestLabel.font = UIFont(name: "Courier", size: 30)
        requestLabel.textColor = .black
        requestLabel.textAlignment = .center
        requestLabelView.addSubview(requestLabel)
    }

    private func setConstraintsForRequestLabel() {
        requestLabel.widthAnchor.constraint(equalToConstant: requestLabelView.bounds.size.width - 40).isActive = true
        requestLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        requestLabel.centerXAnchor.constraint(equalTo: requestLabelView.centerXAnchor, constant: 0).isActive = true
        requestLabel.centerYAnchor.constraint(equalTo: requestLabelView.centerYAnchor, constant: 0).isActive = true
    }
    
    // MARK: - makeActivityIndicator
    func makeActivityIndicator() {
        createActivityIndicator()
        setConstraintsForActivityIndicator()
    }
    
    private func createActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.isHidden = true
        imagesCollectionView?.addSubview(activityIndicator)
    }
    
    private func setConstraintsForActivityIndicator() {
        guard let imagesCollectionView = imagesCollectionView else { return }
        activityIndicator.centerXAnchor.constraint(equalTo: imagesCollectionView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: imagesCollectionView.centerYAnchor).isActive = true
    }
    
    // MARK: - reloadElements
    func reloadElements() {
        imagesCollectionView?.removeFromSuperview()
        searchLabelView.removeFromSuperview()
        searchLabel.removeFromSuperview()
        requestLabelView.removeFromSuperview()
        searchTextFieldView.removeFromSuperview()
        searchTextField.removeFromSuperview()
        cancelButton.removeFromSuperview()
        requestLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
    }
}

// MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchTextField {
            guard let requestText = textField.text?.trimmingCharacters(in: .whitespaces) else { return false }
            sendRequestToMainPresenter(request: requestText)
            requestLabel.text = requestText
            searchTextField.resignFirstResponder()
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
            return true
        }
        return false
    }
}

extension UITextField {

 func setLeftIcon(_ icon: UIImage) {

    let padding = 8
    let size = 20

    let outerView = UIView(frame: CGRect(x: 0, y: 0, width: size+padding, height: size) )
    let iconView  = UIImageView(frame: CGRect(x: padding, y: 0, width: size, height: size))
    iconView.image = icon
    outerView.addSubview(iconView)

    leftView = outerView
    leftViewMode = .always
  }
}

// MARK: - UIViewControllerExtension
extension UIViewController {
    
    func createMock() -> UIView {
        
        let mockView = UIView()
        let mockImageView = UIImageView()
        let mockLabel = UILabel()
        
        // mock view
        mockView.backgroundColor = .white
        mockView.translatesAutoresizingMaskIntoConstraints = false
        mockView.isHidden = true
        view.addSubview(mockView)
        
        mockView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mockView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        mockView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        mockView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        // mock image view
        mockImageView.image = UIImage(named: "rotate")
        mockImageView.translatesAutoresizingMaskIntoConstraints = false
        mockImageView.contentMode = .scaleAspectFit
        mockView.addSubview(mockImageView)
        
        mockImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        mockImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        mockImageView.centerXAnchor.constraint(equalTo: mockView.centerXAnchor, constant: 0).isActive = true
        mockView.centerYAnchor.constraint(equalTo: mockImageView.centerYAnchor, constant: 30).isActive = true
        
        // mock label
        mockLabel.text = "turn the device, it's inconvenient"
        mockLabel.translatesAutoresizingMaskIntoConstraints = false
        mockLabel.textAlignment = .center
        mockLabel.font = UIFont(name: "Courier", size: 20)
        mockView.addSubview(mockLabel)
        
        mockLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: mockView.bounds.size.width - 40).isActive = true
        mockLabel.topAnchor.constraint(equalTo: mockImageView.bottomAnchor, constant: 30).isActive = true
        mockLabel.leadingAnchor.constraint(equalTo: mockView.leadingAnchor, constant: 20).isActive = true
        mockView.trailingAnchor.constraint(equalTo: mockLabel.trailingAnchor, constant: 20).isActive = true
        
        return mockView
    }
}
