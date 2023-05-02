//
//  Collection+Extension.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/14.
//

import Foundation

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
