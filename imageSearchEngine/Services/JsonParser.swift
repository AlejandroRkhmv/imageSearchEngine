//
//  JsonParser.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 15.02.2023.
//

import Foundation

class JsonParser {
    
    func parseJSON(with data: Data) -> GoogleImageAPI? {
        let decoder = JSONDecoder()
        do {
            let imagesResults = try decoder.decode(GoogleImageAPI.self, from: data)
            return imagesResults
        } catch let error as NSError {
            print(String(describing: error))
        }
        return nil
    }
}
