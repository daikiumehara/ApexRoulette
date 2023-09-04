//
//  ButtonModifier.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/05/11.
//  Copyright © 2023 Daiki Umehara. All rights reserved.
//

import SwiftUI

struct PrimaryButtonModifier: ButtonStyle {
    private let cornerRadius: CGFloat = 10
    private let offset: CGFloat = 6
    private let defaultOffset: CGFloat = 2

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(R.color.foreground.secondary.color)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundColor(R.color.foreground.black.color)
                    .offset(x: 0, y: configuration.isPressed ? defaultOffset : offset)
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .foregroundColor(R.color.foreground.primary.color)
                    }
            }
            .offset(x: 0, y: configuration.isPressed ? offset : defaultOffset)
    }
}

extension Button {
    func primaryButton() -> some View {
        self.buttonStyle(PrimaryButtonModifier())
    }
}

struct ButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        Button("OK") {
        }
        .primaryButton()
    }
}
