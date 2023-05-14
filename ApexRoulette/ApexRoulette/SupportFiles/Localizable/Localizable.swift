//
//  Localizable.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/05/14.
//  Copyright © 2023 Daiki Umehara. All rights reserved.
//

import Foundation

func localizeString(key: LocalizeKeys.Value) -> String {
    return NSLocalizedString(key.key, comment: "")
}

protocol LocalizeKeyGeneratable {
    var key: String { get }
}


struct LocalizeKeys {
    enum Value: String, LocalizeKeyGeneratable {

        // MARK: - common
        case start

        // MARK: - character
        case character

        case Bloodhound
        case Gibraltar
        case Lifeline
        case Pathfinder
        case Wraith
        case Bangalore
        case Coustic
        case Mirage
        case Octane
        case Wattson
        case Crypto
        case Revenant
        case Loba
        case Rampart
        case Horizon
        case Fuse
        case Valkyrie
        case Seer
        case Ash
        case MadMaggie
        case NewCastle
        case Vantage
        case Catalyst
        case Ballistic

        case character_pick

        // MARK: - ammo
        case ammo
        case light_ammo
        case heavy_ammo
        case shotgun_ammo
        case sniper_ammo
        case energy_ammo

        case pick_ammo

        // MARK: - Picker
        case pick_clear
        case pick_all

        var key: String {
            return rawValue
        }
    }
}
