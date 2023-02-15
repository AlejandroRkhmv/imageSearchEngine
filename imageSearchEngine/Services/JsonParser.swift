//
//  JsonParser.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class JsonParser {
    
    func parseJSON(with data: Data) -> [ImagesResult]? {
        let decoder = JSONDecoder()
        do {
            let imagesResults = try decoder.decode([ImagesResult].self, from: data)
            return imagesResults
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
