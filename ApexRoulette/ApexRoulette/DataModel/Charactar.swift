//
//  Charactar.swift
//  ApexRoucasete
//
//  Created by daiki umehara on 2023/02/11.
//

import Foundation

enum Character: String, Identifiable, CaseIterable {
    case assyu
    case reisu
    case kuriputo
    case rebunannto
    case miraju
    case bangaroru
    case bloodhound
    case banteji
    case horaizon
    case jiburarutaru
    case kosuthikku
    case rannpato
    case pasufainnda
    case nyukyassuru
    case varukiri
    case roba
    case wattoson
    case katarisuto
    case okutan
    case sia
    case raifurain
    case madomagi
    case hyuzu

    static let none = CharacterInfo(name: "？？？", image: R.image.character.hatena()!)

    var id: String {
        self.info.id
    }

    var info: CharacterInfo {
        switch self {
        case .assyu: return CharacterInfo(name: "アッシュ", image: R.image.character.assyu()!)
        case .reisu: return CharacterInfo(name: "レイス", image: R.image.character.reisu()!)
        case .kuriputo: return CharacterInfo(name: "クリプト", image: R.image.character.kuriputo()!)
        case .rebunannto: return CharacterInfo(name: "レヴナント", image: R.image.character.rebunannto()!)
        case .miraju: return CharacterInfo(name: "ミラージュ", image: R.image.character.miraju()!)
        case .bangaroru: return CharacterInfo(name: "バンガロール", image: R.image.character.bangaroru()!)
        case .bloodhound: return CharacterInfo(name: "ブラッドハウンド", image: R.image.character.bloodhound()!)
        case .banteji: return CharacterInfo(name: "ヴァンテージ", image: R.image.character.banteji()!)
        case .horaizon: return CharacterInfo(name: "ホライゾン", image: R.image.character.horaizon()!)
        case .jiburarutaru: return CharacterInfo(name: "ジブラルタル", image: R.image.character.jiburarutaru()!)
        case .kosuthikku: return CharacterInfo(name: "コースティック", image: R.image.character.kosuthikku()!)
        case .rannpato: return CharacterInfo(name: "ランパート", image: R.image.character.rannpato()!)
        case .pasufainnda: return CharacterInfo(name: "パスファインダー", image: R.image.character.pasufainnda()!)
        case .nyukyassuru: return CharacterInfo(name: "ニューキャッスル", image: R.image.character.nyukyassuru()!)
        case .varukiri: return CharacterInfo(name: "ヴァルキリー", image: R.image.character.varukiri()!)
        case .roba: return CharacterInfo(name: "ローバ", image: R.image.character.roba()!)
        case .wattoson: return CharacterInfo(name: "ワットソン", image: R.image.character.wattoson()!)
        case .katarisuto: return CharacterInfo(name: "カタリスト", image: R.image.character.katarisuto()!)
        case .okutan: return CharacterInfo(name: "オクタン", image: R.image.character.okutan()!)
        case .sia: return CharacterInfo(name: "シア", image: R.image.character.sia()!)
        case .raifurain: return CharacterInfo(name: "ライフライン", image: R.image.character.raifurain()!)
        case .madomagi: return CharacterInfo(name: "マッドマギー", image: R.image.character.maddomagi()!)
        case .hyuzu: return CharacterInfo(name: "ヒューズ", image: R.image.character.hyuzu()!)
        }
    }
}
