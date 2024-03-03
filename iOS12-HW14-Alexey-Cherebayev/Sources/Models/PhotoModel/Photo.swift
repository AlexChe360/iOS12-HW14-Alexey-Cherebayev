//
//  Photo.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 02.03.2024.
//

import Foundation

struct Photo {
    let image: String
    let name: String
    let count: Int
    
    init(image: String, name: String, count: Int) {
        self.image = image
        self.name = name
        self.count = count
    }
}

extension Photo {
    
    static func getPhoto() -> [Photo] {
        return [
            Photo(image: "cold-water-upscaled", name: "Cold Water", count: 10),
            Photo(image: "favourites-upscaled", name: "Favourites", count: 0),
            Photo(image: "recent-upscaled", name: "Recent", count: 30),
            Photo(image: "love-upscaled", name: "Love", count: 45),
            Photo(image: "3d-print-upscaled", name: "3d Print", count: 22),
            Photo(image: "2017-upscaled", name: "2017", count: 109),
            Photo(image: "whatsapp-upscaled", name: "WhatsApp", count: 16),
            Photo(image: "skype-upscaled", name: "Skype", count: 0),
            Photo(image: "pinterest-upscaled", name: "Pinterest", count: 100),
            Photo(image: "dji-album-upscaled", name: "DJI Album", count: 3)
        ]
    }
    
}
