//
//  Character.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/06.
//

import UIKit

struct CharacterInfo: Identifiable {
    var id: String {
        name
    }
    let name: String
    let image: UIImage

    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
}
