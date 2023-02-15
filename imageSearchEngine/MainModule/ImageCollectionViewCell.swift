//
//  ImageCollectionViewCell.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "image"
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    var dataForImage: Data? {
        
        didSet {
            if let data = dataForImage {
                imageView.image = UIImage(data: data)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 5, y: 0, width: contentView.bounds.width - 2, height: contentView.bounds.height - 2)
    }
}
