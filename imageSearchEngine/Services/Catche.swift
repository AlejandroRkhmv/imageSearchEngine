//
//  Catche.swift
//  imageSearchEngine
//
//  Created by Александр Рахимов on 18.02.2023.
//

import UIKit

class Catche {
    
    static var cache: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        return cache
    }()
    
    private init() {
        
    }
}
