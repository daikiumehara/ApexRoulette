//
//  Rswift+Extension.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/08.
//

import SwiftUI
import RswiftResources

extension RswiftResources.StringResource {
    var localizedStringKey: LocalizedStringKey {
        LocalizedStringKey(key.description)
    }

    var text: Text {
        Text(localizedStringKey)
    }
}

public extension RswiftResources.ColorResource {
    var color: Color {
        Color(name)
    }
}

public extension RswiftResources.ImageResource {
    var image: Image {
        Image(name)
    }
}
