//
//  Ammo.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/06.
//

import Foundation
import Rswift
import SwiftUI

enum Ammo: String, Identifiable, CaseIterable {
    case light
    case heavy
    case shotgun
    case sniper
    case energy

    static let none = AmmoInfo(name: "???",
                               main: R.color.ammo.none.color,
                               sub: R.color.ammo.none.color,
                               cover: R.color.ammo.none.color)

    var id: String {
        return self.info.name
    }

    var info: AmmoInfo {
        switch self {
        case .light:
            return AmmoInfo(name: R.string.localizable.light_ammo(),
                            main: R.color.ammo.lightMain.color,
                            sub: R.color.ammo.lightSub.color,
                            cover: R.color.ammo.cover.color)
        case .heavy:
            return AmmoInfo(name: R.string.localizable.heavy_ammo(),
                            main: R.color.ammo.heavyMain.color,
                            sub: R.color.ammo.heavySub.color,
                            cover: R.color.ammo.cover.color)
        case .shotgun:
            return AmmoInfo(name: R.string.localizable.shotgun_ammo(),
                            main: R.color.ammo.shotgunMain.color,
                            sub: R.color.ammo.shotgunSub.color,
                            cover: R.color.ammo.cover.color)
        case .sniper:
            return AmmoInfo(name: R.string.localizable.sniper_ammo(),
                            main: R.color.ammo.sniperMain.color,
                            sub: R.color.ammo.sniperSub.color,
                            cover: R.color.ammo.cover.color)
        case .energy:
            return AmmoInfo(name: R.string.localizable.energy_ammo(),
                            main: R.color.ammo.energyMain.color,
                            sub: R.color.ammo.energySub.color,
                            cover: R.color.ammo.cover.color)
        }
    }
}
