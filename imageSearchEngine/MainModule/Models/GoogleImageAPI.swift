//
//  GoogleImageAPI.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

// MARK: - GoogleImageAPI
struct GoogleImageAPI: Decodable {
    
    let imagesResults: [ImagesResult]

    enum CodingKeys: String, CodingKey {
       
        case imagesResults = "images_results"
    }
}

// MARK: - ImagesResult
struct ImagesResult: Decodable {
    
    let link: String
    let original: String
}

