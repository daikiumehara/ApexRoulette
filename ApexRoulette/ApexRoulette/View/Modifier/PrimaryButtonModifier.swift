//
//  ButtonModifier.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/05/11.
//  Copyright © 2023 Daiki Umehara. All rights reserved.
//

import SwiftUI

struct PrimaryButtonModifier: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(R.color.foreground.secondary.color)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(R.color.foreground.primary.color)
            }
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
