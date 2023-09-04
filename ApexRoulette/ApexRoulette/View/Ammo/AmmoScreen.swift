//
//  AmmoScreen.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/11.
//

import SwiftUI

enum AmmoCount: Int, CaseIterable {
    case one = 1
    case two = 2

    var image: Image {
        switch self {
        case .one: return Image(systemName: "circlebadge.fill")
        case .two: return Image(systemName: "circlebadge.2.fill")
        }
    }
}

struct AmmoScreen: View {
    private let delay = 0.3

    @State private var isAmmoPicked = false
    @State private var isStartRoulette = false
    @State private var isStartRouletteAnimation = false
    @State private var pickedAmmo: [Ammo] = []
    @State private var selectedAmmo: [Ammo] = Ammo.allCases
    @State private var isPresented: Bool = false
    @State private var isDuplicable: Bool = true
    @State private var ammoCount: AmmoCount = .two

    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100, maximum: 120))]

    var body: some View {
        VStack {
            Spacer()

            HStack {
                ForEach(0..<ammoCount.rawValue, id: \.self) { index in
                    AmmoView(ammo: pickedAmmo[safe: index]?.info ?? Ammo.none)
                        .aspectRatio(1, contentMode: .fit)
                        .animation(
                            .easeInOut(duration: delay).delay(delay * CGFloat(index)),
                            value: isStartRouletteAnimation
                        )
                        .frame(maxHeight: 200)
                }
            }

            Button {
                withAnimation {
                    DispatchQueue.global().async {
                        isStartRoulette = true
                        if isAmmoPicked {
                            pickedAmmo = []
                            Thread.sleep(forTimeInterval: 0.3)
                        }
                        pickedAmmo = AmmoRoulette.start(list: selectedAmmo, pickCount: ammoCount.rawValue, isDuplicable: isDuplicable)
                        isStartRouletteAnimation = true
                        Thread.sleep(forTimeInterval: CGFloat(ammoCount.rawValue) * delay)
                        isStartRouletteAnimation = false
                        isStartRoulette = false
                        isAmmoPicked = true
                    }
                }
            } label: {
                Text(localizeString(key: .start))
                    .bold()
                    .frame(width: 100, height: 100)
            }
            .primaryCircleButton(disable: .init(
                get: { isStartRoulette || selectedAmmo.count == 0 },
                set: { _ in }
            ))

            Spacer()

            SelectCounter(selection: $ammoCount, items: AmmoCount.allCases, toImage: { item in
                item.image
            })
            .frame(width: 300)
            .padding()

            Button {
                isPresented = true
            } label: {
                Text(localizeString(key: .pick_ammo))
                    .bold()
            }
            .primaryButton()
            .fullScreenCover(isPresented: $isPresented) {
                AmmoPickerView(isPresented: $isPresented, selectedAmmo: $selectedAmmo)
            }

            Spacer()
        }
    }
}

struct AmmoScreen_Previews: PreviewProvider {
    static var previews: some View {
        AmmoScreen()
    }
}
