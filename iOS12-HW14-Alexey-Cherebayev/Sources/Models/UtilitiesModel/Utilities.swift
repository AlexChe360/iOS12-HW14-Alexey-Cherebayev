//
//  Utilities.swift
//  iOS12-HW14-Alexey-Cherebayev
//
//  Created by  Alexey on 02.03.2024.
//

import Foundation

struct Utilities {
    let image: String
    let name: String
    let count: Int
    
    init(image: String, name: String, count: Int) {
        self.image = image
        self.name = name
        self.count = count
    }
}

extension Utilities {
    static func getUtilities() -> [Utilities] {
        return [
            Utilities(image: "square.and.arrow.down", name: "Imports", count: 0),
            Utilities(image: "eye.slash", name: "Hidden", count: 0),
            Utilities(image: "trash", name: "Rcently Deleted", count: 0)
        ]
    }
}
