//
//  AmmoTriangle.swift
//  ApexRoulette
//
//  Created by daiki umehara on 2023/02/14.
//

import SwiftUI

struct AmmoTriangle: View {
    var width: CGFloat
    var height: CGFloat
    var origin: CGPoint = .zero

    private let kado = 0.15
    
    var body: some View {
        Path { path in
            path.move(to: .init(x: origin.x + width * kado, y: origin.y))
            path.addLines([.init(x: origin.x + width * (1 - kado), y: origin.y),
                           .init(x: origin.x + width * (1 - kado / 2), y: origin.y + height * kado / 2 * sqrt(3)),
                           .init(x: origin.x + width * (0.5 + kado / 2), y: origin.y + height * (1 - kado * sqrt(3))),
                           .init(x: origin.x + width * (0.5 - kado / 2), y: origin.y + height * (1 - kado * sqrt(3))),
                           .init(x: origin.x + width * (kado / 2), y: origin.y + height * kado / 2 * sqrt(3)),
                           .init(x: origin.x + width * kado, y: origin.y)])
            path.closeSubpath()
        }
        .fill()
    }
}

struct AmmoTriangle_Previews: PreviewProvider {
    static var previews: some View {
        AmmoTriangle(width: 100, height: 100)
    }
}
