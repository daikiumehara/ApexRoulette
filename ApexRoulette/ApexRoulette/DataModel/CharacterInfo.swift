//
//  Character.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/06.
//

import UIKit
import SwiftUI

enum RoleInfo: String, CaseIterable, Identifiable {
    case scumisher
    case support
    case assault
    case reconnaissance
    case controller
    case none

    var id: String {
        self.rawValue
    }

    var text: String {
        return localizeString(key: .init(rawValue: self.rawValue)!)
    }

    var image: Image {
        switch self {
        case .scumisher:
            return Image(systemName: "figure.run")

        case .support:
            return Image(systemName: "checkerboard.shield")

        case .assault:
            return Image(systemName: "headlight.daytime.fill")

        case .reconnaissance:
            return Image(systemName: "antenna.radiowaves.left.and.right")

        case .controller:
            return Image(systemName: "gamecontroller.fill")

        case .none:
            return Image(systemName: "questionmark.square.fill")
        }
    }
}

struct CharacterInfo: Identifiable {
    var id: String {
        name
    }
    let name: String
    let role: RoleInfo
    let image: UIImage

    init(name: String, image: UIImage, role: RoleInfo) {
        self.name = name
        self.image = image
        self.role = role
    }
}
