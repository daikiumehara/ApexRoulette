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
    case barisuthik

    static let none = CharacterInfo(name: "？？？", image: R.image.character.hatena()!)

    var id: String {
        self.info.id
    }

    var info: CharacterInfo {
        switch self {
        case .assyu: return CharacterInfo(name: localizeString(key: .Ash), image: R.image.character.assyu()!)
        case .reisu: return CharacterInfo(name: localizeString(key: .Wraith), image: R.image.character.reisu()!)
        case .kuriputo: return CharacterInfo(name: localizeString(key: .Crypto), image: R.image.character.kuriputo()!)
        case .rebunannto: return CharacterInfo(name: localizeString(key: .Revenant), image: R.image.character.rebunannto()!)
        case .miraju: return CharacterInfo(name: localizeString(key: .Mirage), image: R.image.character.miraju()!)
        case .bangaroru: return CharacterInfo(name: localizeString(key: .Bangalore), image: R.image.character.bangaroru()!)
        case .bloodhound: return CharacterInfo(name: localizeString(key: .Bloodhound), image: R.image.character.bloodhound()!)
        case .banteji: return CharacterInfo(name: localizeString(key: .Vantage), image: R.image.character.banteji()!)
        case .horaizon: return CharacterInfo(name: localizeString(key: .Horizon), image: R.image.character.horaizon()!)
        case .jiburarutaru: return CharacterInfo(name: localizeString(key: .Gibraltar), image: R.image.character.jiburarutaru()!)
        case .kosuthikku: return CharacterInfo(name: localizeString(key: .Coustic), image: R.image.character.kosuthikku()!)
        case .rannpato: return CharacterInfo(name: localizeString(key: .Rampart), image: R.image.character.rannpato()!)
        case .pasufainnda: return CharacterInfo(name: localizeString(key: .Pathfinder), image: R.image.character.pasufainnda()!)
        case .nyukyassuru: return CharacterInfo(name: localizeString(key: .NewCastle), image: R.image.character.nyukyassuru()!)
        case .varukiri: return CharacterInfo(name: localizeString(key: .Valkyrie), image: R.image.character.varukiri()!)
        case .roba: return CharacterInfo(name: localizeString(key: .Loba), image: R.image.character.roba()!)
        case .wattoson: return CharacterInfo(name: localizeString(key: .Wattson), image: R.image.character.wattoson()!)
        case .katarisuto: return CharacterInfo(name: localizeString(key: .Catalyst), image: R.image.character.katarisuto()!)
        case .okutan: return CharacterInfo(name: localizeString(key: .Octane), image: R.image.character.okutan()!)
        case .sia: return CharacterInfo(name: localizeString(key: .Seer), image: R.image.character.sia()!)
        case .raifurain: return CharacterInfo(name: localizeString(key: .Lifeline), image: R.image.character.raifurain()!)
        case .madomagi: return CharacterInfo(name: localizeString(key: .MadMaggie), image: R.image.character.maddomagi()!)
        case .hyuzu: return CharacterInfo(name: localizeString(key: .Fuse), image: R.image.character.hyuzu()!)
        case .barisuthik: return CharacterInfo(name: localizeString(key: .Ballistic), image: R.image.character.barisuthik()!)
        }
    }
}
