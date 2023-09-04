//
//  PrimaryCircleModifier.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/07/17.
//  Copyright © 2023 Daiki Umehara. All rights reserved.
//

import SwiftUI

struct PrimaryCircleButtonModifier: ButtonStyle {
    @Binding var disable: Bool
    private let offset: CGFloat = 6
    private let defaultOffset: CGFloat = 2

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(R.color.foreground.secondary.color)
            .background {
                Circle()
                    .foregroundColor(R.color.foreground.black.color)
                    .offset(x: 0, y: configuration.isPressed ? defaultOffset : offset)
                    .overlay {
                        Circle()
                            .foregroundColor(disable ? R.color.foreground.invalid.color : R.color.foreground.primary.color)
                    }
            }
            .offset(x: 0, y: !configuration.isPressed ? defaultOffset : offset)
    }
}

extension Button {
    func primaryCircleButton(disable: Binding<Bool>) -> some View {
        self.buttonStyle(PrimaryCircleButtonModifier(disable: disable))
            .disabled(disable.wrappedValue)
    }
}

struct PrimaryCircleButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
            } label: {
                Text("OK")
                    .frame(width: 50, height: 50)
            }
            .primaryCircleButton(disable: .constant(true))

            Button {
            } label: {
                Text("OK")
                    .frame(width: 50, height: 50)
            }
            .primaryCircleButton(disable: .constant(false))
        }
    }
}
