//
//  CharacterScreen.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/11.
//

import SwiftUI

struct CharacterScreen: View {
    private let delay = 0.3

    @State private var isCharaPicked = false
    @State private var isStartRoulette = false
    @State private var isStartRouletteAnimation = false
    @State private var pickedChara: [Character] = []
    @State private var selectedChara: [Character] = Character.allCases
    @State private var isPresentedCharaPick: Bool = false
    @State private var isPresentedDetailSetting: Bool = false
    @State private var info: DetailSettingInfo = .init()

    var body: some View {
        VStack {
            Spacer()

            HStack {
                ForEach(0..<info.member.rawValue, id: \.self) { index in
                    CharacterView(character: pickedChara[safe: index]?.info ?? Character.none, isDisplayRole: true)
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
                    startRoulette()
                }
            } label: {
                Text(localizeString(key: .start))
                    .bold()
                    .frame(width: 100, height: 100)
            }
            .primaryCircleButton(disable: .init(
                get: { disableStartButton },
                set: { _ in }
            ))

            Spacer()

            HStack(spacing: 16) {
                Button {
                    isPresentedCharaPick = true
                } label: {
                    Text(localizeString(key: .character_pick))
                        .bold()
                }
                .primaryButton()
                .fullScreenCover(isPresented: $isPresentedCharaPick) {
                    CharacterPickView(isPresented: $isPresentedCharaPick, selectedChara: $selectedChara)
                }

                Button {
                    isPresentedDetailSetting = true
                } label: {
                    Text(localizeString(key: .detail_setting))
                        .bold()
                }
                .primaryButton()
                .fullScreenCover(isPresented: $isPresentedDetailSetting) {
                    DetailSettingView(isPresentedDetailSetting: $isPresentedDetailSetting, info: $info)
                }
            }

            Spacer()
        }
    }

    private func startRoulette() {
        DispatchQueue.global().async {
            isStartRoulette = true
            if isCharaPicked {
                pickedChara = []
                Thread.sleep(forTimeInterval: 0.3)
            }
            if info.countSum != 0 {
                let scumisher = CharacterRoulette.start(list: selectedChara.filter({ $0.info.role == .scumisher }), pickCount: info.scumisher)
                let support = CharacterRoulette.start(list: selectedChara.filter({ $0.info.role == .support }), pickCount: info.support)
                let assault = CharacterRoulette.start(list: selectedChara.filter({ $0.info.role == .assault }), pickCount: info.assault)
                let reconnaissance = CharacterRoulette.start(list: selectedChara.filter({ $0.info.role == .reconnaissance }), pickCount: info.reconnaissance)
                let controller = CharacterRoulette.start(list: selectedChara.filter({ $0.info.role == .controller }), pickCount: info.controller)
                let list = scumisher + support + assault + reconnaissance + controller
                let overList = selectedChara.filter({ chara in
                    !list.contains(where: { $0 == chara })
                })
                pickedChara = list + CharacterRoulette.start(list: overList, pickCount: info.member.rawValue - info.countSum)
            } else {
                pickedChara = CharacterRoulette.start(list: selectedChara, pickCount: info.member.rawValue)
            }
            isStartRouletteAnimation = true
            Thread.sleep(forTimeInterval: CGFloat(info.member.rawValue) * delay)
            isStartRouletteAnimation = false
            isStartRoulette = false
            isCharaPicked = true
        }
    }

    private var disableStartButton: Bool {
        isStartRoulette || 
        selectedChara.count < info.member.rawValue ||
        selectedChara.filter({ $0.info.role == .scumisher }).count < info.scumisher ||
        selectedChara.filter({ $0.info.role == .assault }).count < info.assault ||
        selectedChara.filter({ $0.info.role == .support }).count < info.support ||
        selectedChara.filter({ $0.info.role == .reconnaissance }).count < info.reconnaissance ||
        selectedChara.filter({ $0.info.role == .controller }).count < info.controller
    }
}

struct CharacterScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterScreen()
    }
}
