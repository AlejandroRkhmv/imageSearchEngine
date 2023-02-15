//
//  GoogleImageAPI.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

struct GoogleImageAPI: Codable {

    let imagesResults: [ImagesResult]

    enum CodingKeys: String, CodingKey {
        case imagesResults = "images_results"
    }
}

struct ImagesResult: Codable {
    let position: Int
    let thumbnail: String
    let source: String
    let title: String
    let link: String
    let original: String
    let originalWidth: Int
    let originalHeight: Int
    let isProduct: Bool
    let tag: String?
    let inStock: Bool?

    enum CodingKeys: String, CodingKey {
        case position
        case thumbnail
        case source
        case title
        case link
        case original
        case originalWidth = "original_width"
        case originalHeight = "original_height"
        case isProduct = "is_product"
        case tag
        case inStock = "in_stock"
    }
}
