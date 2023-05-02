//
//  AmmoInfo.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/03/24.
//

import SwiftUI

struct AmmoInfo: Identifiable {
    var id: String {
        name
    }
    let name: String
    let main: Color
    let sub: Color
    let cover: Color

    init(name: String, main: Color, sub: Color, cover: Color) {
        self.name = name
        self.main = main
        self.sub = sub
        self.cover = cover
    }
}
