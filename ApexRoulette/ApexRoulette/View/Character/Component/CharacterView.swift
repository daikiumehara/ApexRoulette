//
//  CharacterView.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/08.
//

import SwiftUI

struct CharacterView: View {
    var character: CharacterInfo

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Image(uiImage: character.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                Text(character.name)
                    .font(.system(size: geometry.size.width*0.10))
                    .bold()
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(10)
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static let size: CGFloat = 200
    static let characters: [CharacterInfo] = [
        CharacterInfo(name: "アッシュ", image: R.image.character.assyu()!),
        CharacterInfo(name: "レイス", image: R.image.character.reisu()!),
        CharacterInfo(name: "クリプト", image: R.image.character.kuriputo()!),
        CharacterInfo(name: "レヴナント", image: R.image.character.rebunannto()!),
        CharacterInfo(name: "ミラージュ", image: R.image.character.miraju()!),
        CharacterInfo(name: "バンガロール", image: R.image.character.bangaroru()!),
        CharacterInfo(name: "ブラッドハウンド", image: R.image.character.bloodhound()!),
        CharacterInfo(name: "ヴァンテージ", image: R.image.character.banteji()!),
        CharacterInfo(name: "ホライゾン", image: R.image.character.horaizon()!),
        CharacterInfo(name: "ジブラルタル", image: R.image.character.jiburarutaru()!),
        CharacterInfo(name: "コースティック", image: R.image.character.kosuthikku()!),
        CharacterInfo(name: "ランパート", image: R.image.character.rannpato()!),
        CharacterInfo(name: "パスファインダー", image: R.image.character.pasufainnda()!),
        CharacterInfo(name: "ニューキャッスル", image: R.image.character.nyukyassuru()!),
        CharacterInfo(name: "ヴァルキリー", image: R.image.character.varukiri()!),
        CharacterInfo(name: "ローバ", image: R.image.character.roba()!),
        CharacterInfo(name: "ワットソン", image: R.image.character.wattoson()!),
        CharacterInfo(name: "カタリスト", image: R.image.character.katarisuto()!),
        CharacterInfo(name: "オクタン", image: R.image.character.okutan()!),
        CharacterInfo(name: "シア", image: R.image.character.sia()!),
        CharacterInfo(name: "ライフライン", image: R.image.character.raifurain()!),
        CharacterInfo(name: "マッドマギー", image: R.image.character.maddomagi()!),
        CharacterInfo(name: "ヒューズ", image: R.image.character.hyuzu()!)
    ]
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(characters) { chara in
                    CharacterView(character: chara)
                        .frame(width: size, height: size)
                }
            }
            .padding(.horizontal)
        }
    }
}
