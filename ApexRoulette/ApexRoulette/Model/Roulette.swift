//
//  Roulette.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/13.
//

import Foundation

struct Roulette<T: Identifiable> {
    static func start(list: [T], pickCount: Int, isDuplicable: Bool) -> [T] {
        var result = [T]()

        if pickCount <= 0 {
            return result
        }

        while true {
            // 乱数取得、listの値を取る
            let random = Int.random(in: 0..<list.count)
            let value = list[random]

            if isDuplicable {
                result.append(value)
            } else {
                // 値が含まれていなければ追加
                if !result.contains(where: { $0.id == value.id }) {
                    result.append(value)
                }
            }

            if result.count >= pickCount {
                break
            }
        }

        return result
    }
}

struct CharacterRoulette {
    static func start(list: [Character], pickCount: Int) -> [Character] {
        Roulette.start(list: list, pickCount: pickCount, isDuplicable: false)
    }
}

struct AmmoRoulette {
    static func start(list: [Ammo], pickCount: Int, isDuplicable: Bool) -> [Ammo] {
        Roulette.start(list: list, pickCount: pickCount, isDuplicable: isDuplicable)
    }
}
