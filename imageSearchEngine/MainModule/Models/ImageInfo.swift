//
//  ImageInfo.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 16.02.2023.
//

import Foundation

struct ImageInfo: Equatable {
    
    let imageData: Data
    let webLink: String
    
    init(imageData: Data, webLink: String) {
        self.imageData = imageData
        self.webLink = webLink
    }
}
