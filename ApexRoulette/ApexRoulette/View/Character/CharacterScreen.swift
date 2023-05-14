//
//  CharacterScreen.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/11.
//

import SwiftUI

enum Member: Int, CaseIterable {
    case solo = 1
    case duo = 2
    case trio = 3

    var image: Image {
        switch self {
        case .solo: return Image(systemName: "person.fill")
        case .duo: return Image(systemName: "person.2.fill")
        case .trio: return Image(systemName: "person.3.fill")
        }
    }
}

struct CharacterScreen: View {
    private let delay = 0.3

    @State private var isCharaPicked = false
    @State private var isStartRoulette = false
    @State private var isStartRouletteAnimation = false
    @State private var pickedChara: [Character] = []
    @State private var selectedChara: [Character] = Character.allCases
    @State private var isPresented: Bool = false
    @State private var member: Member = .trio

    var body: some View {
        VStack {
            Spacer()

            HStack {
                ForEach(0..<member.rawValue, id: \.self) { index in
                    CharacterView(character: pickedChara[safe: index]?.info ?? Character.none)
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
                        if isCharaPicked {
                            pickedChara = []
                            Thread.sleep(forTimeInterval: 0.3)
                        }
                        pickedChara = CharacterRoulette.start(list: selectedChara, pickCount: member.rawValue)
                        isStartRouletteAnimation = true
                        Thread.sleep(forTimeInterval: CGFloat(member.rawValue) * delay)
                        isStartRouletteAnimation = false
                        isStartRoulette = false
                        isCharaPicked = true
                    }
                }
            } label: {
                Circle()
                    .foregroundColor(R.color.foreground.primary.color)
                    .overlay {
                        Text(localizeString(key: .start))
                            .bold()
                            .foregroundColor(R.color.foreground.secondary.color)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    .frame(width: 100)
            }
            .disabled(isStartRoulette)
            .disabled(selectedChara.count < member.rawValue)
            .opacity(isStartRoulette || selectedChara.count < member.rawValue ? 0.2 : 1.0)

            Spacer()


            SelectCounter(selection: $member, items: Member.allCases, toImage: { item in
                item.image
            })
                .frame(width: 300)
                .padding()

            Button {
                isPresented = true
            } label: {
                Text(localizeString(key: .character_pick))
                    .bold()
            }
            .primaryButton()
            .fullScreenCover(isPresented: $isPresented) {
                CharacterPickView(isPresented: $isPresented, selectedChara: $selectedChara)
            }

            Spacer()
        }
    }
}

struct CharacterScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterScreen()
    }
}
