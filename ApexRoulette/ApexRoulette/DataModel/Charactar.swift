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
    case conduit

    static let none = CharacterInfo(name: "？？？", image: R.image.character.hatena()!, role: .none)

    var id: String {
        self.info.id
    }

    var info: CharacterInfo {
        switch self {
        case .assyu: return CharacterInfo(name: localizeString(key: .Ash), image: R.image.character.assyu()!, role: .assault)
        case .reisu: return CharacterInfo(name: localizeString(key: .Wraith), image: R.image.character.reisu()!, role: .scumisher)
        case .kuriputo: return CharacterInfo(name: localizeString(key: .Crypto), image: R.image.character.kuriputo()!, role: .reconnaissance)
        case .rebunannto: return CharacterInfo(name: localizeString(key: .Revenant), image: R.image.character.rebunannto()!, role: .scumisher)
        case .miraju: return CharacterInfo(name: localizeString(key: .Mirage), image: R.image.character.miraju()!, role: .support)
        case .bangaroru: return CharacterInfo(name: localizeString(key: .Bangalore), image: R.image.character.bangaroru()!, role: .assault)
        case .bloodhound: return CharacterInfo(name: localizeString(key: .Bloodhound), image: R.image.character.bloodhound()!, role: .reconnaissance)
        case .banteji: return CharacterInfo(name: localizeString(key: .Vantage), image: R.image.character.banteji()!, role: .reconnaissance)
        case .horaizon: return CharacterInfo(name: localizeString(key: .Horizon), image: R.image.character.horaizon()!, role: .scumisher)
        case .jiburarutaru: return CharacterInfo(name: localizeString(key: .Gibraltar), image: R.image.character.jiburarutaru()!, role: .support)
        case .kosuthikku: return CharacterInfo(name: localizeString(key: .Coustic), image: R.image.character.kosuthikku()!, role: .controller)
        case .rannpato: return CharacterInfo(name: localizeString(key: .Rampart), image: R.image.character.rannpato()!, role: .controller)
        case .pasufainnda: return CharacterInfo(name: localizeString(key: .Pathfinder), image: R.image.character.pasufainnda()!, role: .scumisher)
        case .nyukyassuru: return CharacterInfo(name: localizeString(key: .NewCastle), image: R.image.character.nyukyassuru()!, role: .support)
        case .varukiri: return CharacterInfo(name: localizeString(key: .Valkyrie), image: R.image.character.varukiri()!, role: .scumisher)
        case .roba: return CharacterInfo(name: localizeString(key: .Loba), image: R.image.character.roba()!, role: .support)
        case .wattoson: return CharacterInfo(name: localizeString(key: .Wattson), image: R.image.character.wattoson()!, role: .controller)
        case .katarisuto: return CharacterInfo(name: localizeString(key: .Catalyst), image: R.image.character.katarisuto()!, role: .controller)
        case .okutan: return CharacterInfo(name: localizeString(key: .Octane), image: R.image.character.okutan()!, role: .scumisher)
        case .sia: return CharacterInfo(name: localizeString(key: .Seer), image: R.image.character.sia()!, role: .reconnaissance)
        case .raifurain: return CharacterInfo(name: localizeString(key: .Lifeline), image: R.image.character.raifurain()!, role: .support)
        case .madomagi: return CharacterInfo(name: localizeString(key: .MadMaggie), image: R.image.character.maddomagi()!, role: .assault)
        case .hyuzu: return CharacterInfo(name: localizeString(key: .Fuse), image: R.image.character.hyuzu()!, role: .assault)
        case .barisuthik: return CharacterInfo(name: localizeString(key: .Ballistic), image: R.image.character.barisuthik()!, role: .assault)
        case .conduit: return CharacterInfo(name: localizeString(key: .Conduit), image: R.image.character.conduit()!, role: .support)
        }
    }
}
