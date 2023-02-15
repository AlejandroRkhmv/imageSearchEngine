//
//  GoogleImageAPI.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

// MARK: - GoogleImageAPI
struct GoogleImageAPI: Codable {
    let searchMetadata: SearchMetadata
    let searchParameters: SearchParameters
    let searchInformation: SearchInformation
    let shoppingResults: [ShoppingResult]
    let suggestedSearches: [SuggestedSearch]
    let imagesResults: [ImagesResult]

    enum CodingKeys: String, CodingKey {
        case searchMetadata = "search_metadata"
        case searchParameters = "search_parameters"
        case searchInformation = "search_information"
        case shoppingResults = "shopping_results"
        case suggestedSearches = "suggested_searches"
        case imagesResults = "images_results"
    }
}

// MARK: - ImagesResult
struct ImagesResult: Codable {
    let position: Int
    let thumbnail: String
    let source, title: String
    let link: String
    let original: String
    let originalWidth, originalHeight: Int
    let isProduct: Bool
    let tag: String?
    let inStock: Bool?

    enum CodingKeys: String, CodingKey {
        case position, thumbnail, source, title, link, original
        case originalWidth = "original_width"
        case originalHeight = "original_height"
        case isProduct = "is_product"
        case tag
        case inStock = "in_stock"
    }
}

// MARK: - SearchInformation
struct SearchInformation: Codable {
    let imageResultsState: String
    let queryDisplayed: QueryDisplayed
    let menuItems: [MenuItem]

    enum CodingKeys: String, CodingKey {
        case imageResultsState = "image_results_state"
        case queryDisplayed = "query_displayed"
        case menuItems = "menu_items"
    }
}

// MARK: - MenuItem
struct MenuItem: Codable {
    let position: Int
    let title: String
    let link: String?
    let serpapiLink: String?

    enum CodingKeys: String, CodingKey {
        case position, title, link
        case serpapiLink = "serpapi_link"
    }
}

enum QueryDisplayed: String, Codable {
    case apple = "Apple"
    case atT = "AT&T"
    case verizon = "Verizon"
}

// MARK: - SearchMetadata
struct SearchMetadata: Codable {
    let id, status: String
    let jsonEndpoint: String
    let createdAt, processedAt: String
    let googleURL: String
    let rawHTMLFile: String
    let totalTimeTaken: Double

    enum CodingKeys: String, CodingKey {
        case id, status
        case jsonEndpoint = "json_endpoint"
        case createdAt = "created_at"
        case processedAt = "processed_at"
        case googleURL = "google_url"
        case rawHTMLFile = "raw_html_file"
        case totalTimeTaken = "total_time_taken"
    }
}

// MARK: - SearchParameters
struct SearchParameters: Codable {
    let engine: String
    let q: QueryDisplayed
    let googleDomain, ijn, device, tbm: String

    enum CodingKeys: String, CodingKey {
        case engine, q
        case googleDomain = "google_domain"
        case ijn, device, tbm
    }
}

// MARK: - ShoppingResult
struct ShoppingResult: Codable {
    let position: Int
    let title: String
    let price: Price
    let extractedPrice: Int
    let link: String
    let source: QueryDisplayed
    let shipping: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case position, title, price
        case extractedPrice = "extracted_price"
        case link, source, shipping, thumbnail
    }
}

enum Price: String, Codable {
    case the000Now = "$0.00 now"
    case the109900 = "$1,099.00"
}

// MARK: - SuggestedSearch
struct SuggestedSearch: Codable {
    let name: String
    let link: String
    let chips: String
    let serpapiLink: String
    let thumbnail: String

    enum CodingKeys: String, CodingKey {
        case name, link, chips
        case serpapiLink = "serpapi_link"
        case thumbnail
    }
}

