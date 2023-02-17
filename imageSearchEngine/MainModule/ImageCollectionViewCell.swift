//
//  ImageCollectionViewCell.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "image"
    
    lazy var cache: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        return cache
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var urlForImage: String? {
        
        didSet {
            if let urlForImage = urlForImage {
                DispatchQueue.global().async {
                    if let image = self.cache.object(forKey: urlForImage as AnyObject) {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    } else {
                        guard let url = URL(string: urlForImage) else { return }
                        guard let data = try? Data(contentsOf: url) else { return }
                        DispatchQueue.main.async {
                            self.imageView.image = UIImage(data: data)
                            guard let image = UIImage(data: data) else { return }
                            self.cache.setObject(image, forKey: urlForImage as AnyObject)
                        }
                    }
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: 0, width: contentView.bounds.width - 2, height: contentView.bounds.height - 2)
    }
}
