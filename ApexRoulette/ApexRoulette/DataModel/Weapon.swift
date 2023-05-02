//
//  Weapon.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/06.
//

import UIKit

class Weapon: Identifiable {
    var id: String {
        name
    }
    let name: String
    let ammo: Ammo
    let type: WeaponType
    let image: UIImage

    init(name: String, ammo: Ammo, type: WeaponType, image: UIImage) {
        self.name = name
        self.ammo = ammo
        self.type = type
        self.image = image
    }
}

enum WeaponType {
    case assault
    case SMG
    case LMG
    case shotgun
    case sniper
    case pistol
    case marksMan
}
