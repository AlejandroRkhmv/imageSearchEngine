//
//  ImageDataModel.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

struct ImageData {
    
    let imageUrl: String
    let webLink: String
    
    init?(imageResult: ImagesResult) {
        self.imageUrl = imageResult.original
        self.webLink = imageResult.link
    }
}
