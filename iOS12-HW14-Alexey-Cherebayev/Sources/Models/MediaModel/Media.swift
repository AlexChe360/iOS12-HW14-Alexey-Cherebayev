//
//  Media.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 02.03.2024.
//

import Foundation

struct Media {
    let image: String
    let name: String
    let count: Int
    
    init(image: String, name: String, count: Int) {
        self.image = image
        self.name = name
        self.count = count
    }
}

extension Media {
    
    static func getMedia() -> [Media] {
        return [
            Media(image: "video", name: "Videos", count: 4),
            Media(image: "person.crop.square", name: "Selfies", count: 205),
            Media(image: "livephoto", name: "Live Photos", count: 465),
            Media(image: "f.cursive.circle", name: "Portrait", count: 134),
            Media(image: "camera.viewfinder", name: "ScreenShots", count: 47),
            Media(image: "record.circle", name: "Screen Recordings", count: 4),
            Media(image: "square.stack.3d.forward.dottedline", name: "Animated", count: 2)
        ]
    }
}
