//
//  ImageCollectionViewCell.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "image"
    
    var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = #colorLiteral(red: 0.907659471, green: 0.9076595306, blue: 0.907659471, alpha: 1)
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    var urlForImage: String? {
        
        didSet {
            imageView.image = nil
            if let urlForImage = urlForImage {
                DispatchQueue.global().async {
                    if let image = Catche.cache.object(forKey: urlForImage as AnyObject) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                            self.imageView.backgroundColor = self.contentView.backgroundColor
                            self.activityIndicator.stopAnimating()
                        }
                    } else {
                        guard let url = URL(string: urlForImage) else { return }
                        guard let data = try? Data(contentsOf: url) else { return }
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: data)
                            self.imageView.backgroundColor = self.contentView.backgroundColor
                            self.activityIndicator.stopAnimating()
                            guard let image = UIImage(data: data) else { return }
                            Catche.cache.setObject(image, forKey: urlForImage as AnyObject)
                        }
                    }
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        makeActivityIndicator()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width - 2, height: contentView.bounds.height - 2)
    }
    
    private func makeActivityIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
